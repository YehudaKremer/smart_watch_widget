import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/clockPage.dart';
import 'package:smart_watch_widget/pages/clockSettings/clockSettingsForm.dart';
import 'package:smart_watch_widget/state/appState.dart';
import 'package:smart_watch_widget/utils/animations.dart';
import 'package:window_manager/window_manager.dart';

class ClockSettings extends StatefulWidget {
  const ClockSettings({Key? key}) : super(key: key);

  @override
  State<ClockSettings> createState() => _ClockSettingsState();
}

class _ClockSettingsState extends State<ClockSettings> {
  bool show = false;

  @override
  void initState() {
    super.initState();
    final windowPosition = context.read<AppState>().windowPosition;

    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Future.delayed(Duration(milliseconds: 200), () async {
              await windowManager.setBounds(Rect.fromLTWH(
                  windowPosition!.dx - 200, windowPosition.dy, 450, 250));
              setState(() => show = true);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: ScaffoldPage(
          padding: const EdgeInsets.all(0),
          content: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.watch<AppState>().isWindowFocused
                    ? FluentTheme.of(context).accentColor
                    : FluentTheme.of(context).shadowColor.withOpacity(0.4),
                width: 1.4,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: AnimatedSlideFade(
                    child: show
                        ? GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: ClockPage(),
                          )
                        : Container(),
                  ),
                ),
                Expanded(
                  child: AnimatedSlideFade(
                    child: show
                        ? ClockSettingsForm(
                            onDismiss: () {
                              setState(() => show = false);
                              Future.delayed(Duration(milliseconds: 200),
                                  () async {
                                final windowPosition =
                                    context.read<AppState>().windowPosition;

                                await windowManager.setBounds(Rect.fromLTWH(
                                    windowPosition!.dx,
                                    windowPosition.dy,
                                    250,
                                    250));
                                Navigator.pop(context);
                              });
                            },
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
