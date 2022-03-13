import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/clockPage.dart';
import 'package:smart_watch_widget/pages/clockSettings/clockSettingsForm.dart';
import 'package:smart_watch_widget/state/appState.dart';
import 'package:window_manager/window_manager.dart';

class ClockSettings extends StatefulWidget {
  const ClockSettings({Key? key}) : super(key: key);

  @override
  State<ClockSettings> createState() => _ClockSettingsState();
}

class _ClockSettingsState extends State<ClockSettings> {
  @override
  void initState() {
    super.initState();
    final windowPosition = context.read<AppState>().windowPosition;
    windowManager.setBounds(
        Rect.fromLTWH(windowPosition!.dx - 200, windowPosition.dy, 450, 250));
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: ClockPage(),
                  ),
                ),
                Expanded(
                  child: ClockSettingsForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
