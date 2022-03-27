import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/background/backgroundPage.dart';
import 'package:smart_watch_widget/pages/clockSettings/clockSettingsPage.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:window_manager/window_manager.dart';
import 'home/layout.dart';
import 'menu/menuItem.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Timer? _debounceWindowResize;

  @override
  void dispose() {
    _debounceWindowResize?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: ListView(
        padding: EdgeInsets.all(context.read<AppState>().watchSize / 10),
        children: [
          MenuItem(
            title: 'Back',
            icon: FluentIcons.back,
            onPressed: () {
              navigatorPop(context);
            },
          ),
          Container(height: 15),
          Consumer<AppState>(
            builder: (context, state, child) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Watch Size',
                ),
                Container(width: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Slider(
                    min: defaultWatchSize,
                    max: 500,
                    value: state.watchSize,
                    onChanged: (v) {
                      state.setWatchSize(v);

                      if (_debounceWindowResize?.isActive ?? false)
                        _debounceWindowResize?.cancel();
                      _debounceWindowResize =
                          Timer(const Duration(milliseconds: 500), () async {
                        context.read<AppState>().setWindowPosition(
                            await windowManager.getPosition());
                      });
                    },
                    label: state.watchSize.toStringAsFixed(0),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 15),
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
                Container(width: 20),
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
                Container(width: 35),
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
