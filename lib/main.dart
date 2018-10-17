import 'package:flutter/material.dart';

import 'helpers/api/main_api.dart';

import 'helpers/storage/database.dart';
import 'helpers/storage/cache.dart';

import 'models/api/user.dart';

import 'views/pages/start/start_page.dart';
import 'views/pages/start/splash_page.dart';
import 'views/pages/main/main_page.dart';


void main() => runApp(new App());

class App extends StatefulWidget {

  @override
  AppState createState() => AppState();
}


class AppState extends State<App> {

  bool loading = true;

  @override
  void initState() {
    super.initState();
    
    Database.init().then(
      (v){
        var user = Database.getCurrentUser();
        if (user != null){
          MainAPI.token = user.token;
          MainAPI.getMe().then(
            (me){
              if (me != null){
                MainAPI.getMyRestaurants().then((rest){
                  if (rest != null && rest.isNotEmpty){
                    setState(() {
                      Cache.currentUser = me;
                      Cache.restaurant = rest[0];
                    });
                  }
                  setState(() {
                    loading = false;
                  });
                });
              } else {
                setState(() {
                  loading = false;
                });
              }
            }
          );
        } else {
          setState(() {
            loading = false;
          });
        }
      }
    );
  }
 
  @override
  Widget build(BuildContext context) {
    if (loading){
      return MaterialApp(
        title: 'Food App',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: Color.fromARGB(255, 247, 131, 6),
          accentColor: Colors.white
        ),
        home: SplashPage()
      );
    }
    if (Cache.currentUser != null) {
      return MaterialApp(
        title: 'Food App',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: Color.fromARGB(255, 240, 240, 240),
          accentColor: Color.fromARGB(255, 247, 131, 6),
    
        ),
        home: MainPage(),
      );
    } else {
      return MaterialApp(
        title: 'Food App',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: Color.fromARGB(255, 247, 131, 6),
          accentColor: Color.fromARGB(255, 247, 131, 6),
        ),
        home: StartPage(),
      );
    }
  }
}
