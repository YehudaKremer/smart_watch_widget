import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/background/watch_background.dart';
import 'package:smart_watch_widget/pages/clock_page.dart';
import 'package:smart_watch_widget/pages/clockSettings/clock_settings_colors.dart';
import 'package:smart_watch_widget/pages/clockSettings/clock_settings_form.dart';
import 'package:smart_watch_widget/app_state.dart';
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
        (_) => Future.delayed(const Duration(milliseconds: 200), () async {
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
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: AnimatedSlideFade(
                    child: show
                        ? ClockSettingsForm(
                            onDismiss: () {
                              setState(() => show = false);
                              Future.delayed(const Duration(milliseconds: 200),
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
                Expanded(
                  child: AnimatedSlideFade(
                    child: show
                        ? Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 212,
                                  width: 212,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: FluentTheme.of(context)
                                          .shadowColor
                                          .withOpacity(0.4),
                                      width: 1.4,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            MediaQuery.of(context).size.height /
                                                2)),
                                  ),
                                  child: const ClipOval(
                                    child: WatchBackground(),
                                  ),
                                ),
                                const ClockPage(),
                                const SizedBox(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
