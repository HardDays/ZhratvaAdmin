import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../routes/default_page_route.dart';
import '../../../../views/pages/start/start_page.dart';

import '../../../../models/api/order.dart';
import '../../../../helpers/storage/database.dart';

import '../../../../helpers/view/localization.dart';
import '../../../../helpers/view/formatter.dart';
import '../../../../helpers/storage/cache.dart';
import '../../../../helpers/api/main_api.dart';
import '../../../../helpers/api/consts.dart';

class CurrentOrdersPage extends StatefulWidget {
  @override
  CurrentOrdersPageState createState() =>  CurrentOrdersPageState();
}

class CurrentOrdersPageState extends State<CurrentOrdersPage> with SingleTickerProviderStateMixin {
  Timer timer;
  FlutterLocalNotificationsPlugin notifications;

  GlobalKey<RefreshIndicatorState> refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    
    notifications =  FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid = AndroidInitializationSettings('logo');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    notifications.initialize(initializationSettings, selectNotification: (val){});

    refreshOrders().then((val){
      timer = Timer.periodic(Duration(seconds: 30), onTimer);        
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTimer(Timer timer){
    refreshOrders();
  }

  Future<Null> refreshOrders(){
    return MainAPI.getRestaurantCurrentOrders(Cache.restaurant.id).then(
      (res){
        List<Order> result = res;
        if (res != null && Cache.currentOrders != null){
          int count = res.length;
          for (var order in res){
            for (var ex in Cache.currentOrders){
              if (ex.id == order.id){
                count--;
                break;
              }
            }
            for (var ex in Cache.acceptedByAdminOrders){
              if (ex.id == order.id){
                result.remove(order);
                count--;
                break;
              }
            }
          }
          if (count > 0){
            showNotification();
          }
        }
        setState(() {
          Cache.currentOrders = result;      
        });        
      }     
    );
  }

  Future showNotification() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'foodapp.admin.notifyid', 'foodapp.admin', 'Food app admin notifications',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await notifications.show(
        0, Localization.textOrder, Localization.textNewOrder, platformChannelSpecifics,
        payload: Localization.textOrder);
  }

  Widget buildTimer(Order order){
    if (order.orderStatus == Consts.noPayment){
      return Column(
        children:[
          Text(Localization.textNotPayed,
            style: TextStyle(
              fontSize: 28.0,
              color: Color.fromARGB(255, 247, 131, 6)
            )
          )
        ]         
      );
    } else if (order.orderStatus == Consts.inProcess) {
      Duration left = order.timeLeft();
      if (left.isNegative){
        return Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 40.0,
          child: FlatButton(
            color: Color.fromARGB(255, 247, 131, 6),
            onPressed: (){    
              setState(
                () {
                  if (Cache.acceptedByAdminOrders == null) {
                    Cache.acceptedByAdminOrders = [];
                  }
                  Cache.acceptedByAdminOrders.add(order); 
                  Cache.currentOrders.remove(order);     
                }
              );
            },
            child: Text(Localization.buttonFinishOrder,
              style: TextStyle(
                color: Colors.white
              ),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
          ),
        );
      } else {
        return Column(
          children:[
            Text(Localization.textCustomerTake,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey
              )
            ),
            Text(Formatter.longDuration(order.timeLeft()),
              style: TextStyle(
                fontSize: 28.0,
                color: Color.fromARGB(255, 247, 131, 6)
              )
            )
          ]         
        );
      }
    } 
  }

  Widget buildOrderStatus(Order order){
    String text;
    Color color;
    if (order.orderStatus == 'no_payment'){
      text = Localization.textNotPayed;
      color = Color.fromARGB(255, 227, 116, 116);
    } else if (order.orderStatus == 'in_process') {
      Duration left = order.timeLeft();
      if (left.isNegative){
        text = Localization.textReady;
        color = Color.fromARGB(255, 0, 150, 0);
      } else {
        text = Localization.textInProcess;
        color = Color.fromARGB(255, 190, 190, 0);
      }
    } 
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 25.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)), 
        border: Border.all(
          color: color
        )
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 4.0),
        child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {  
    if (Cache.currentOrders == null){
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(Localization.titleOrders,
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Color.fromARGB(255, 247, 131, 6),  
          actions:[ 
              PopupMenuButton<int>(         
                onSelected: (value){
                  if (value == 0){
                    Cache.currentUser = null;
                    Database.deleteCurrentUser(); 
                    Navigator.pushReplacement(
                      context, 
                      DefaultPageRoute(builder: (context) => StartPage())
                    );
                  }
                },
                itemBuilder:  (BuildContext context) => [
                  PopupMenuItem<int>(child: Text(Localization.textLogout), value: 0)
                ],
              )
          ]
        ),
        body: Center(
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 247, 131, 6))),            
        ),  
      );
    }
    if (Cache.currentOrders.isEmpty){
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
            title: Text(Localization.titleOrders,
             style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Color.fromARGB(255, 247, 131, 6),     
        ),
        body: RefreshIndicator(
          onRefresh: refreshOrders,
          key: refreshIndicatorKey,
          color: Color.fromARGB(255, 247, 131, 6),
          child: Center(
            child: Text(Localization.textNoOrders,
              style: TextStyle(fontSize: 25.0, color: Color.fromARGB(160, 0, 0, 0)),
            )
          ),
        )      
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Localization.titleOrders,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Color.fromARGB(255, 247, 131, 6),
        actions:[ 
              PopupMenuButton<int>(         
                onSelected: (value){
                  if (value == 0){
                    Cache.currentUser = null;
                    Database.deleteCurrentUser(); 
                    Navigator.pushReplacement(
                      context, 
                      DefaultPageRoute(builder: (context) => StartPage())
                    );
                  }
                },
                itemBuilder:  (BuildContext context) => [
                  PopupMenuItem<int>(child: Text(Localization.textLogout), value: 0)
                ],
              )
          ]
      ),
      body: RefreshIndicator(
        onRefresh: refreshOrders,
        key: refreshIndicatorKey,
        color: Color.fromARGB(255, 247, 131, 6),
        child: ListView.builder(
        itemCount: Cache.currentOrders.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              showNotification();
            /*  Navigator.push(
                context,
                DefaultPageRoute(builder: (context) => OrderPage(order: Cache.currentOrders[index])),
              );*/
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
              width: MediaQuery.of(context).size.width * 1.0,
              child: Card(
                child:  Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Padding(padding: EdgeInsets.only(top: 0.0)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text('${Localization.textOrder} №${Cache.currentOrders[index].id.substring(0, 8)}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black
                                ),
                              ),
                              buildOrderStatus(Cache.currentOrders[index]),             
                            ]
                          ),
                          Padding(padding: EdgeInsets.only(top: 2.0)),
                          Text('${Localization.textOrderedAt} ${DateFormat('HH:mm dd.MM.y').format(Cache.currentOrders[index].createdAt)}',
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ), 
                          Padding(padding: EdgeInsets.only(top: 15.0)),
                          Row(
                            children: [
                              Icon(Icons.person,
                                size: 20.0,
                                color: Color.fromARGB(160, 0, 0, 0)
                              ),
                              Padding(padding: EdgeInsets.only(right: 5.0)),
                              Expanded(
                                child: Text((Cache.currentOrders[index].user.firstName ?? '') + ' ' + (Cache.currentOrders[index].user.lastName ?? ''),
                                  style: TextStyle(
                                    color: Color.fromARGB(160, 0, 0, 0)
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.view_headline,
                                size: 20.0,
                                color: Color.fromARGB(160, 0, 0, 0)
                              ),
                              Padding(padding: EdgeInsets.only(right: 5.0)),
                              Text(
                                Cache.currentOrders[index].orderMenuItems.map((item) => '${item.menuItem.name} x ${item.count}').join('\n'),
                                overflow: TextOverflow.fade,
                                maxLines: 3,
                                style: TextStyle(
                                  color: Color.fromARGB(160, 0, 0, 0)
                                ),
                              )
                            ]
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            children: [
                              Icon(Icons.attach_money,
                                size: 20.0,
                                color: Color.fromARGB(160, 0, 0, 0)
                              ),
                              Padding(padding: EdgeInsets.only(right: 5.0)),
                              Text('${Cache.currentOrders[index].price} ${Localization.textRUB}',
                                style: TextStyle(
                                  color: Color.fromARGB(160, 0, 0, 0)
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            children: [
                              Icon(Icons.timer,
                                size: 20.0,
                                color: Color.fromARGB(160, 0, 0, 0)
                              ),
                              Padding(padding: EdgeInsets.only(right: 5.0)),
                              Text(DateFormat('HH:mm dd.MM.y').format(Cache.currentOrders[index].date),
                                style: TextStyle(
                                  color: Color.fromARGB(160, 0, 0, 0)
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 5.0)),
                          Divider(),
                          Padding(padding: EdgeInsets.only(top: 5.0)),
                          Container(
                            alignment: Alignment.center,
                            child: buildTimer(Cache.currentOrders[index])
                          )
                        ]
                      ),
                    ),    
                  )
                )
              ),
            );
          }
        ),
      ), 
    );
  }
}