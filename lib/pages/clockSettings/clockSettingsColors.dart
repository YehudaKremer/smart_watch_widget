import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/clockSettings/clockSettingsState.dart';
import 'package:smart_watch_widget/widgets/colorButton.dart';
import 'package:smart_watch_widget/widgets/colorPickerDialog.dart';

class ClockSettingsColors extends StatelessWidget {
  const ClockSettingsColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultBackgroundColor =
        FluentTheme.of(context).scaffoldBackgroundColor;
    var defaultNumberColor = FluentTheme.of(context).accentColor.light;
    var defaultTickColor = FluentTheme.of(context).accentColor.dark;
    var defaultDigitalClockColor = FluentTheme.of(context).accentColor;
    var defaultHourHandColor = FluentTheme.of(context).accentColor.light;
    var defaultMinuteHandColor = FluentTheme.of(context).accentColor;
    var defaultSecondHandColor = material.Colors.redAccent;

    return Consumer<ClockSettingsState>(
      builder: (context, clockSettingsState, child) {
        final state = clockSettingsState.clockSettings;
        //final watchSize =context.read<AppState>().watchSize;
        return Stack(
          children: [
            state.showNumbers
                ? ColorButton(
                    // top: watchSize * 0.22,
                    // left: watchSize * 0.41,
                    top: 33,
                    left: 127,
                    size: 14,
                    color: state.numberColor ?? defaultNumberColor,
                    tooltip: 'Numbers Color',
                    onTap: () async {
                      await showDialog<String>(
                        barrierDismissible: true,
                        context: context,
                        barrierColor: Colors.transparent,
                        builder: (BuildContext context) => ColorPickerDialog(
                          color: state.numberColor ?? defaultNumberColor,
                          onColorChanged: (color) {
                            state.numberColor = color;
                            clockSettingsState.notify();
                          },
                        ),
                      );
                      clockSettingsState.updateClockSettings();
                    },
                  )
                : Container(),
            state.showTicks
                ? ColorButton(
                    top: 30,
                    left: 180,
                    size: 14,
                    color: state.tickColor ?? defaultTickColor,
                    tooltip: 'Ticks Color',
                    onTap: () async {
                      await showDialog<String>(
                        barrierDismissible: true,
                        context: context,
                        barrierColor: Colors.transparent,
                        builder: (BuildContext context) => ColorPickerDialog(
                          color: state.tickColor ?? defaultTickColor,
                          onColorChanged: (color) {
                            state.tickColor = color;
                            clockSettingsState.notify();
                          },
                        ),
                      );
                      clockSettingsState.updateClockSettings();
                    },
                  )
                : Container(),
            state.showDigitalClock
                ? ColorButton(
                    top: 172,
                    left: 110,
                    size: 14,
                    color: state.digitalClockColor ?? defaultDigitalClockColor,
                    tooltip: 'Digital Clock Color',
                    onTap: () async {
                      await showDialog<String>(
                        barrierDismissible: true,
                        context: context,
                        barrierColor: Colors.transparent,
                        builder: (BuildContext context) => ColorPickerDialog(
                          color: state.digitalClockColor ??
                              defaultDigitalClockColor,
                          onColorChanged: (color) {
                            state.digitalClockColor = color;
                            clockSettingsState.notify();
                          },
                        ),
                      );
                      clockSettingsState.updateClockSettings();
                    },
                  )
                : Container(),
            ColorButton(
              top: 100,
              left: 90,
              size: 14,
              color: state.hourHandColor ?? defaultHourHandColor,
              tooltip: 'Hour Hand Color',
              onTap: () async {
                await showDialog<String>(
                  barrierDismissible: true,
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (BuildContext context) => ColorPickerDialog(
                    color: state.hourHandColor ?? defaultHourHandColor,
                    onColorChanged: (color) {
                      state.hourHandColor = color;
                      clockSettingsState.notify();
                    },
                  ),
                );
                clockSettingsState.updateClockSettings();
              },
            ),
            ColorButton(
              top: 80,
              left: 75,
              size: 14,
              color: state.minuteHandColor ?? defaultMinuteHandColor,
              tooltip: 'Minute Hand Color',
              onTap: () async {
                await showDialog<String>(
                  barrierDismissible: true,
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (BuildContext context) => ColorPickerDialog(
                    color: state.minuteHandColor ?? defaultMinuteHandColor,
                    onColorChanged: (color) {
                      state.minuteHandColor = color;
                      clockSettingsState.notify();
                    },
                  ),
                );
                clockSettingsState.updateClockSettings();
              },
            ),
            state.showSecondHand
                ? ColorButton(
                    top: 60,
                    left: 60,
                    size: 14,
                    color: state.secondHandColor ?? defaultSecondHandColor,
                    tooltip: 'Second Hand Color',
                    onTap: () async {
                      await showDialog<String>(
                        barrierDismissible: true,
                        context: context,
                        barrierColor: Colors.transparent,
                        builder: (BuildContext context) => ColorPickerDialog(
                          color:
                              state.secondHandColor ?? defaultSecondHandColor,
                          onColorChanged: (color) {
                            state.secondHandColor = color;
                            clockSettingsState.notify();
                          },
                        ),
                      );
                      clockSettingsState.updateClockSettings();
                    },
                  )
                : Container(),
            ColorButton(
              top: 140,
              left: 45,
              size: 14,
              color: state.backgroundColor ?? defaultBackgroundColor,
              tooltip: 'Background Color',
              onTap: () async {
                await showDialog<String>(
                  barrierDismissible: true,
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (BuildContext context) => ColorPickerDialog(
                    color: state.backgroundColor ?? defaultBackgroundColor,
                    onColorChanged: (color) {
                      state.backgroundColor = color;
                      clockSettingsState.notify();
                    },
                  ),
                );
                clockSettingsState.updateClockSettings();
              },
            ),
          ],
        );
      },
    );
  }
}
