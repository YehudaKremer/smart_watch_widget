import 'package:fluent_ui/fluent_ui.dart';

class ClockSettings {
  Color? backgroundColor;
  Color? numberColor;
  Color? tickColor;
  Color? digitalClockColor;
  Color? hourHandColor;
  Color? minuteHandColor;
  Color? secondHandColor;
  bool showDigitalClock = true;
  bool showNumbers = true;
  bool showSecondHand = true;
  bool showTicks = true;
  bool useMilitaryTime = true;
  bool showAllNumbers = true;
  double textScaleFactor = 1.4;
  int lastModified = DateTime.now().millisecondsSinceEpoch;

  ClockSettings();

  Map<String, dynamic> toJson() => {
        'backgroundColor': backgroundColor,
        'numberColor': numberColor,
        'tickColor': tickColor,
        'digitalClockColor': digitalClockColor,
        'hourHandColor': hourHandColor,
        'minuteHandColor': minuteHandColor,
        'secondHandColor': secondHandColor,
        'showDigitalClock': showDigitalClock,
        'showNumbers': showNumbers,
        'showSecondHand': showSecondHand,
        'showTicks': showTicks,
        'useMilitaryTime': useMilitaryTime,
        'showAllNumbers': showAllNumbers,
        'textScaleFactor': textScaleFactor,
      };

  ClockSettings.fromJson(Map<String, dynamic> json)
      : backgroundColor = json['backgroundColor'],
        numberColor = json['numberColor'],
        tickColor = json['tickColor'],
        digitalClockColor = json['digitalClockColor'],
        hourHandColor = json['hourHandColor'],
        minuteHandColor = json['minuteHandColor'],
        secondHandColor = json['secondHandColor'],
        showDigitalClock = json['showDigitalClock'] ?? true,
        showNumbers = json['showNumbers'] ?? true,
        showSecondHand = json['showSecondHand'] ?? true,
        showTicks = json['showTicks'] ?? true,
        useMilitaryTime = json['useMilitaryTime'] ?? true,
        showAllNumbers = json['showAllNumbers'] ?? true,
        textScaleFactor = json['textScaleFactor'] ?? 1.4;
}
