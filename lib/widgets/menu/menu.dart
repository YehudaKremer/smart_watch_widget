import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../appState.dart';
import 'menuItem.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: const EdgeInsets.all(0),
      content: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(30),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        physics: BouncingScrollPhysics(),
        children: [
          MenuItem(
            name: 'Back',
            icon: FluentIcons.back,
            onPressed: () {
              Provider.of<AppState>(context, listen: false).setMenuOpen(false);
              Navigator.pop(context);
            },
          ),
          MenuItem(
            name: 'Move',
            icon: FluentIcons.move,
            cursor: SystemMouseCursors.move,
          ),
          MenuItem(
            name: 'Exit',
            icon: FluentIcons.cancel,
            color: Colors.red,
            onPressed: () => exit(0),
          ),
          MenuItem(name: 'test2', icon: FluentIcons.accept),
          MenuItem(name: 'test4', icon: FluentIcons.accept),
          MenuItem(name: 'settings', icon: FluentIcons.settings),
          MenuItem(name: 'test66', icon: FluentIcons.accept),
          MenuItem(name: 'test7', icon: FluentIcons.accept),
          MenuItem(name: 'settings8', icon: FluentIcons.settings),
          MenuItem(name: 'test229', icon: FluentIcons.accept),
          MenuItem(name: 't3est7', icon: FluentIcons.accept),
          MenuItem(name: 'settin4gs8', icon: FluentIcons.settings),
          MenuItem(name: 'test259', icon: FluentIcons.accept),
          MenuItem(name: 'te6st7', icon: FluentIcons.accept),
          MenuItem(name: 'sett7ings8', icon: FluentIcons.settings),
          MenuItem(name: 'tes8t29', icon: FluentIcons.accept),
          MenuItem(name: 'tes9t7', icon: FluentIcons.accept),
          MenuItem(name: 'setting0s8', icon: FluentIcons.settings),
          MenuItem(name: 'tes-t29', icon: FluentIcons.accept),
          MenuItem(name: 'te=st7', icon: FluentIcons.accept),
          MenuItem(name: 'sett4ings8', icon: FluentIcons.settings),
          MenuItem(name: 'test229', icon: FluentIcons.accept),
        ],
      ),
    );
  }
}
