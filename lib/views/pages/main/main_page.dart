import 'package:flutter/material.dart';

import 'orders/current_orders_page.dart';

import '../../routes/default_page_route.dart';

import '../../../helpers/view/localization.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {  
    return CurrentOrdersPage();
  }
}
