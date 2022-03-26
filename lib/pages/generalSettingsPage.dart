import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/pages/menu/menuItem.dart';
import 'package:smart_watch_widget/state/appState.dart';
import 'package:smart_watch_widget/utils/customScrollBehavior.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:window_manager/window_manager.dart';

class GeneralSettingsPage extends StatefulWidget {
  const GeneralSettingsPage({Key? key}) : super(key: key);

  @override
  State<GeneralSettingsPage> createState() => _GeneralSettingsPageState();
}

class _GeneralSettingsPageState extends State<GeneralSettingsPage> {
  Timer? _debounceWindowResize;

  @override
  void dispose() {
    _debounceWindowResize?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Consumer<AppState>(
        builder: (context, state, child) {
          return ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: ListView(
              padding: EdgeInsets.all(state.watchSize / 10),
              children: [
                MenuItem(
                  title: 'Go Back',
                  icon: FluentIcons.back,
                  onPressed: () => navigatorPop(context),
                ),
                Container(height: 10),
                Row(
                  children: [
                    Text(
                      'Watch Size',
                    ),
                    Container(width: 10),
                    SizedBox(
                      width: 100,
                      child: Slider(
                        min: defaultWatchSize,
                        max: 500,
                        value: state.watchSize,
                        onChanged: (v) {
                          state.setWatchSize(v);

                          if (_debounceWindowResize?.isActive ?? false)
                            _debounceWindowResize?.cancel();
                          _debounceWindowResize = Timer(
                              const Duration(milliseconds: 250), () async {
                            context.read<AppState>().setWindowPosition(
                                await windowManager.getPosition());
                          });
                        },
                        label: state.watchSize.toStringAsFixed(0),
                      ),
                    ),
                  ],
                ),
                Container(height: 10),
                Button(
                  child: Text('Reset All'),
                  onPressed: () async {
                    await showDialog<String>(
                      barrierDismissible: true,
                      context: context,
                      barrierColor: Colors.transparent,
                      builder: (BuildContext context) => ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            color: FluentTheme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.6),
                            child: ContentDialog(
                              title: Text('Reset Settings'),
                              content: Text(
                                  'Do you want to reset all the general settings?'),
                              actions: [
                                Button(
                                  child: Text('Ok'),
                                  onPressed: () async {
                                    await state.resetAll();
                                    navigatorPop(context);
                                  },
                                ),
                                Button(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    navigatorPop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
