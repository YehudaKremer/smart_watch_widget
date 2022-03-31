import 'dart:convert';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_watch_widget/pages/clockSettings/clock_settings.dart';

const clockSettingsPrefsKey = 'clockSettings';

class ClockSettingsState extends ChangeNotifier {
  final SharedPreferences _prefs;

  ClockSettings _clockSettings = ClockSettings();
  ClockSettings get clockSettings => _clockSettings;

  ClockSettingsState(this._prefs) {
    _getClockSettings();
  }

  void _getClockSettings() {
    final clockSettingsString = _prefs.getString(clockSettingsPrefsKey);
    if (clockSettingsString != null) {
      _clockSettings = ClockSettings.fromJson(jsonDecode(clockSettingsString));
      notifyListeners();
    }
  }

  void notify() {
    _clockSettings.lastModified = DateTime.now().millisecondsSinceEpoch;
    notifyListeners();
  }

  void updateClockSettings() {
    notify();
    _prefs.setString(clockSettingsPrefsKey, jsonEncode(_clockSettings));
  }

  Future<void> resetAll() async {
    await _prefs.remove(clockSettingsPrefsKey);
    _clockSettings = ClockSettings();
    notifyListeners();
  }
}
