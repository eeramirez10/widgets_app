import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        onDestinationSelected: onDestinationSelected,
        selectedIndex: navDrawerIndex,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 20, 16, 10),
            child: Text('Main'),
          ),
          ...appMenuItems.sublist(0, 3).map((menuItem) {
            return NavigationDrawerDestination(
              icon: Icon(menuItem.icon),
              label: Text(menuItem.title),
            );
          }),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Text('Mas opciones'),
          ),
          ...appMenuItems.sublist(3).map((menuItem) {
            return NavigationDrawerDestination(
              icon: Icon(menuItem.icon),
              label: Text(menuItem.title),
            );
          })
        ]);
  }

  void onDestinationSelected(int value) {
    final menuItem = appMenuItems[value];
    context.push(menuItem.link);
    setState(() {
      navDrawerIndex = value;
    });

    widget.scaffoldKey.currentState?.closeDrawer();
    
  }
}
