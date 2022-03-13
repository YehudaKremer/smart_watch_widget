import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/menu/menuItem.dart';
import 'package:smart_watch_widget/state/appState.dart';
import 'package:smart_watch_widget/state/clockSettingsState.dart';
import 'package:smart_watch_widget/utils/customScrollBehavior.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:window_manager/window_manager.dart';

class ClockSettingsForm extends StatefulWidget {
  const ClockSettingsForm({Key? key}) : super(key: key);

  @override
  State<ClockSettingsForm> createState() => _ClockSettingsFormState();
}

class _ClockSettingsFormState extends State<ClockSettingsForm> {
  bool show = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) => Future.delayed(
        Duration(milliseconds: 50), () => setState(() => show = true)));
  }

  void updateClockSettings(ClockSettingsState state, Function cb) {
    cb();
    state.updateClockSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClockSettingsState>(
      builder: (context, state, child) {
        final settings = state.clockSettings;
        return Visibility(
          visible: show,
          child: ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                MenuItem(
                  title: 'Go Back',
                  icon: FluentIcons.back,
                  onPressed: () async {
                    setState(() => show = false);
                    final windowPosition =
                        context.read<AppState>().windowPosition;

                    await windowManager.setBounds(Rect.fromLTWH(
                        windowPosition!.dx, windowPosition.dy, 250, 250));
                    Navigator.pop(context);
                  },
                ),
                Container(height: 10),
                ToggleSwitch(
                  checked: settings.showNumbers,
                  onChanged: (v) => updateClockSettings(
                      state, () => settings.showNumbers = v),
                  content: Text('Show Numbers'),
                ),
                Container(height: 10),
                ToggleSwitch(
                  checked: settings.showAllNumbers,
                  onChanged: settings.showNumbers
                      ? (v) => updateClockSettings(
                          state, () => settings.showAllNumbers = v)
                      : null,
                  content: Text(
                    'Show All Numbers',
                    style: TextStyle(
                      color: settings.showNumbers
                          ? FluentTheme.of(context).typography.body!.color
                          : FluentTheme.of(context).disabledColor,
                    ),
                  ),
                ),
                Container(height: 10),
                ToggleSwitch(
                  checked: settings.showTicks,
                  onChanged: (v) =>
                      updateClockSettings(state, () => settings.showTicks = v),
                  content: Text('Show Ticks'),
                ),
                Container(height: 10),
                ToggleSwitch(
                  checked: settings.showSecondHand,
                  onChanged: (v) => updateClockSettings(
                      state, () => settings.showSecondHand = v),
                  content: Text('Show Second Hand'),
                ),
                Container(height: 10),
                ToggleSwitch(
                  checked: settings.showDigitalClock,
                  onChanged: (v) => updateClockSettings(
                      state, () => settings.showDigitalClock = v),
                  content: Text('Show Digital Clock'),
                ),
                Container(height: 10),
                ToggleSwitch(
                  checked: settings.useMilitaryTime,
                  onChanged: settings.showDigitalClock
                      ? (v) => updateClockSettings(
                          state, () => settings.useMilitaryTime = v)
                      : null,
                  content: Text(
                    'Use AM/FM Time',
                    style: TextStyle(
                      color: settings.showDigitalClock
                          ? FluentTheme.of(context).typography.body!.color
                          : FluentTheme.of(context).disabledColor,
                    ),
                  ),
                ),
                Container(height: 10),
                // Material(
                //   child: SizedBox(
                //     width: 100,
                //     height: 150,
                //     child: ColorPicker(
                //       pickerColor: Color(0xff443a49),
                //       onColorChanged: (_) {},
                //     ),
                //   ),
                // ),
                // Container(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}