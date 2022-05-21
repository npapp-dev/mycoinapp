import 'package:flutter/material.dart';
import 'package:mycoinapp/screens/exchange_rate_screen.dart';
import 'package:mycoinapp/screens/main_screen.dart';

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
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Text('Coin app',
        style: TextStyle(color: Colors.white, fontSize: 28))
    ));
    menuTitles.forEach((String element){
      Widget screen = Container();
        menuItems.add(ListTile(
          title: Text(element,
          style: TextStyle(fontSize: 18)),
          onTap: (){
            switch(element){
              case 'Home':
                screen = MainScreen();
                break;
              case 'Exchange rate':
                screen = ExchangeRateScreen();
                break;
            }
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>screen)
            );
          }));
    });
    return menuItems;
  }
}
