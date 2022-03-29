import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/clockPage.dart';
import 'package:smart_watch_widget/pages/clockSettings/clockSettingsColors.dart';
import 'package:smart_watch_widget/pages/clockSettings/clockSettingsForm.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:smart_watch_widget/utils/animations.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:win32/win32.dart';
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
    resizeWindowToMinimalSize();
  }

  void resizeWindowToMinimalSize() {
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Future.delayed(Duration(milliseconds: 200), () async {
              final windowPosition = context.read<AppState>().windowPosition;
              final watchSize = context.read<AppState>().watchSize;
              final height = watchSize >= 250 ? watchSize : 250.0;
              final width =
                  watchSize >= 450 ? watchSize : 450.0; //watchSize + 200.0;
              final screenWidth = GetSystemMetrics(SM_CXSCREEN);
              final screenHeight = GetSystemMetrics(SM_CYSCREEN);

              await windowManager.setBounds(Rect.fromLTWH(
                  windowPosition.dx + width > screenWidth
                      ? screenWidth - width
                      : windowPosition.dx,
                  windowPosition.dy + height > screenHeight
                      ? screenHeight - height
                      : windowPosition.dy,
                  width,
                  height));
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
                        ? Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClockPage(),
                                Container(
                                  height: 245,
                                  width: 220,
                                  child: ClockSettingsColors(),
                                ),
                              ],
                            ),
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
                                final watchSize =
                                    context.read<AppState>().watchSize;

                                await windowManager.setBounds(Rect.fromLTWH(
                                    windowPosition.dx,
                                    windowPosition.dy,
                                    watchSize,
                                    watchSize));
                                navigatorPop(context);
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
