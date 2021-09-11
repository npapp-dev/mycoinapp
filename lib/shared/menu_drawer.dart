import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      )
    );
  }

  List<Widget> buildMenuItems(BuildContext context){
    final List<String> menuTitles =[
      'Home',
      'Exchange rate',
      'My coins'
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Text('Globo Fitness',
        style: TextStyle(color: Colors.white, fontSize: 28))
    ));
    menuTitles.forEach((String element){
        menuItems.add(ListTile(
          title: Text(element,
          style: TextStyle(fontSize: 18)),
          onTap: (){}
        ));
    });
    return menuItems;
  }
}
