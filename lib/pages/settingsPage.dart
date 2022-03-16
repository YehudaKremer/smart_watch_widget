import 'package:fluent_ui/fluent_ui.dart';
import 'package:smart_watch_widget/pages/background/backgroundPage.dart';
import 'package:smart_watch_widget/pages/clockSettings/clockSettingsPage.dart';
import 'home/layout.dart';
import 'menu/menuItem.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          MenuItem(
            title: 'Back',
            icon: FluentIcons.back,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(height: 10),
          Button(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FluentIcons.clock,
                  size: FluentTheme.of(context).typography.bodyLarge!.fontSize,
                ),
                Container(width: 5),
                Text(
                  'Clock Settings',
                  style: FluentTheme.of(context).typography.bodyLarge,
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(context,
                  FluentPageRoute(builder: (context) => ClockSettings()));
            },
          ),
          Container(height: 10),
          Button(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FluentIcons.picture_fill,
                  size: FluentTheme.of(context).typography.bodyLarge!.fontSize,
                ),
                Container(width: 5),
                Text(
                  'Background',
                  style: FluentTheme.of(context).typography.bodyLarge,
                ),
                Container(width: 15),
              ],
            ),
            onPressed: () {
              Navigator.push(context,
                  FluentPageRoute(builder: (context) => BackgroundPage()));
            },
          ),
        ],
      ),
    );
  }
}
