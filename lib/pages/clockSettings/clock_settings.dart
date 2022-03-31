import 'package:fluent_ui/fluent_ui.dart';
import 'package:hexcolor/hexcolor.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'backgroundColor': backgroundColor?.value.toRadixString(16),
      'numberColor': numberColor?.value.toRadixString(16),
      'tickColor': tickColor?.value.toRadixString(16),
      'digitalClockColor': digitalClockColor?.value.toRadixString(16),
      'hourHandColor': hourHandColor?.value.toRadixString(16),
      'minuteHandColor': minuteHandColor?.value.toRadixString(16),
      'secondHandColor': secondHandColor?.value.toRadixString(16),
      'showDigitalClock': showDigitalClock,
      'showNumbers': showNumbers,
      'showSecondHand': showSecondHand,
      'showTicks': showTicks,
      'useMilitaryTime': useMilitaryTime,
      'showAllNumbers': showAllNumbers,
      'textScaleFactor': textScaleFactor,
    };
  }

  ClockSettings.fromJson(Map<String, dynamic> json)
      : backgroundColor = json['backgroundColor'] != null
            ? HexColor(json['backgroundColor'])
            : json['backgroundColor'],
        numberColor = json['numberColor'] != null
            ? HexColor(json['numberColor'])
            : json['numberColor'],
        tickColor = json['tickColor'] != null
            ? HexColor(json['tickColor'])
            : json['tickColor'],
        digitalClockColor = json['digitalClockColor'] != null
            ? HexColor(json['digitalClockColor'])
            : json['digitalClockColor'],
        hourHandColor = json['hourHandColor'] != null
            ? HexColor(json['hourHandColor'])
            : json['hourHandColor'],
        minuteHandColor = json['minuteHandColor'] != null
            ? HexColor(json['minuteHandColor'])
            : json['minuteHandColor'],
        secondHandColor = json['secondHandColor'] != null
            ? HexColor(json['secondHandColor'])
            : json['secondHandColor'],
        showDigitalClock = json['showDigitalClock'] ?? true,
        showNumbers = json['showNumbers'] ?? true,
        showSecondHand = json['showSecondHand'] ?? true,
        showTicks = json['showTicks'] ?? true,
        useMilitaryTime = json['useMilitaryTime'] ?? true,
        showAllNumbers = json['showAllNumbers'] ?? true,
        textScaleFactor = json['textScaleFactor'] ?? 1.4;
}
