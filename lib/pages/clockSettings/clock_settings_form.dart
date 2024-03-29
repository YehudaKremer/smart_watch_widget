import 'package:fluent_ui/fluent_ui.dart';

import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/menu/watch_menu_item.dart';
import 'package:smart_watch_widget/pages/clockSettings/clock_settings_state.dart';
import 'package:smart_watch_widget/utils/custom_scroll_behavior.dart';
import 'package:smart_watch_widget/utils/navigator.dart';

class ClockSettingsForm extends StatefulWidget {
  final void Function() onDismiss;

  const ClockSettingsForm({Key? key, required this.onDismiss})
      : super(key: key);

  @override
  State<ClockSettingsForm> createState() => _ClockSettingsFormState();
}

class _ClockSettingsFormState extends State<ClockSettingsForm> {
  @override
  void initState() {
    super.initState();
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
        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              WatchMenuItem(
                title: 'Go Back',
                icon: FluentIcons.back,
                onPressed: widget.onDismiss,
              ),
              Container(height: 10),
              ToggleSwitch(
                checked: settings.showNumbers,
                onChanged: (v) =>
                    updateClockSettings(state, () => settings.showNumbers = v),
                content: const Text('Show Numbers'),
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
                content: const Text('Show Ticks'),
              ),
              Container(height: 10),
              ToggleSwitch(
                checked: settings.showSecondHand,
                onChanged: (v) => updateClockSettings(
                    state, () => settings.showSecondHand = v),
                content: const Text('Show Second Hand'),
              ),
              Container(height: 10),
              ToggleSwitch(
                checked: settings.showDigitalClock,
                onChanged: (v) => updateClockSettings(
                    state, () => settings.showDigitalClock = v),
                content: const Text('Show Digital Clock'),
              ),
              Container(height: 10),
              ToggleSwitch(
                checked: settings.useMilitaryTime,
                onChanged: settings.showDigitalClock
                    ? (v) => updateClockSettings(
                        state, () => settings.useMilitaryTime = v)
                    : null,
                content: Text(
                  'Use 24 Format',
                  style: TextStyle(
                    color: settings.showDigitalClock
                        ? FluentTheme.of(context).typography.body!.color
                        : FluentTheme.of(context).disabledColor,
                  ),
                ),
              ),
              Container(height: 10),
              Row(
                children: [
                  Text(
                    'Font Size',
                    style: TextStyle(
                      color: settings.showDigitalClock
                          ? FluentTheme.of(context).typography.body!.color
                          : FluentTheme.of(context).disabledColor,
                    ),
                  ),
                  Container(width: 10),
                  SizedBox(
                    width: 100,
                    child: Slider(
                      min: 1,
                      max: 2.5,
                      value: settings.textScaleFactor,
                      onChanged:
                          settings.showNumbers || settings.showDigitalClock
                              ? (v) => updateClockSettings(
                                  state, () => settings.textScaleFactor = v)
                              : null,
                      label: settings.textScaleFactor.toStringAsFixed(1),
                    ),
                  ),
                ],
              ),
              Container(height: 10),
              Button(
                child: const Text('Reset All'),
                onPressed: () async {
                  await showDialog<String>(
                    barrierDismissible: true,
                    context: context,
                    barrierColor: Colors.transparent,
                    builder: (BuildContext context) => ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        color: FluentTheme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.6),
                        child: ContentDialog(
                          title: const Text('Reset Settings'),
                          content: const Text(
                              'Do you want to reset all the clock settings?'),
                          actions: [
                            Button(
                              child: const Text('Ok'),
                              onPressed: () async {
                                await state.resetAll();

                                if (!mounted) return;
                                navigatorPop(context);
                              },
                            ),
                            Button(
                              child: const Text('Cancel'),
                              onPressed: () {
                                navigatorPop(context);
                              },
                            ),
                          ],
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
    );
  }
}
