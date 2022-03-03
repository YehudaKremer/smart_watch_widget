import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../appState.dart';
import 'menuItem.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(30),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          physics: BouncingScrollPhysics(),
          children: [
            MenuItem(
              name: 'back',
              icon: Icons.arrow_back,
              onPressed: () {
                Provider.of<AppState>(context, listen: false)
                    .setMenuOpen(false);
                Navigator.pop(context);
              },
            ),
            MenuItem(name: 'test', icon: Icons.abc),
            MenuItem(name: 'settings', icon: Icons.settings),
            MenuItem(name: 'test2', icon: Icons.gamepad),
            MenuItem(name: 'test4', icon: Icons.abc),
            MenuItem(name: 'settings5', icon: Icons.settings),
            MenuItem(name: 'test66', icon: Icons.gamepad),
            MenuItem(name: 'test7', icon: Icons.abc),
            MenuItem(name: 'settings8', icon: Icons.settings),
            MenuItem(name: 'test229', icon: Icons.gamepad),
            MenuItem(name: 't3est7', icon: Icons.abc),
            MenuItem(name: 'settin4gs8', icon: Icons.settings),
            MenuItem(name: 'test259', icon: Icons.gamepad),
            MenuItem(name: 'te6st7', icon: Icons.abc),
            MenuItem(name: 'sett7ings8', icon: Icons.settings),
            MenuItem(name: 'tes8t29', icon: Icons.gamepad),
            MenuItem(name: 'tes9t7', icon: Icons.abc),
            MenuItem(name: 'setting0s8', icon: Icons.settings),
            MenuItem(name: 'tes-t29', icon: Icons.gamepad),
            MenuItem(name: 'te=st7', icon: Icons.abc),
            MenuItem(name: 'sett4ings8', icon: Icons.settings),
            MenuItem(name: 'test229', icon: Icons.gamepad),
          ],
        ),
      ),
    );
  }
}
