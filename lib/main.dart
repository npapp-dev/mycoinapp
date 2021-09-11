import 'package:flutter/material.dart';
import 'package:mybitcoinapp/screens/main_screen.dart';
import 'package:mybitcoinapp/shared/menu_drawer.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My bitcoin',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('CoinWorld')),
        body: Center(child:MainScreen()),
        drawer: MenuDrawer(),
      )
    );
  }
}
