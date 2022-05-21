import 'package:flutter/material.dart';
import 'package:mycoinapp/screens/main_screen.dart';
import 'package:mycoinapp/shared/menu_drawer.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My coin',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: Center(child:MainScreen()),
        drawer: MenuDrawer(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {

          },
          label: const Text('Select'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.lightGreen,
        ),
      )
    );
  }
}
