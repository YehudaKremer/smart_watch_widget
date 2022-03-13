import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';

class AppState extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _isWindowFocused = true;
  Brightness _brightness = Brightness.dark;
  Offset? _windowPosition;
  Offset? get windowPosition => _windowPosition;
  bool get isWindowFocused => _isWindowFocused;
  Brightness get brightness => _brightness;

  AppState(this.prefs) {
    _getWindowPosition();
    _getThemeMode();
  }

  _getWindowPosition() {
    final dx = prefs.getDouble('windowPositionDx');
    final dy = prefs.getDouble('windowPositionDy');
    if (dx != null || dy != null) _windowPosition = Offset(dx ?? 0, dy ?? 0);
  }

  _getThemeMode() {
    SystemTheme.darkMode.then((isDarkMode) {
      setBrightness(isDarkMode ? Brightness.dark : Brightness.light);
    });
  }

  setBrightness(Brightness brightness) {
    _brightness = brightness;
    SystemTheme.accentInstance.load().then((_) => notifyListeners());
  }

  void setWindowFocused(bool value) {
    _isWindowFocused = value;
    notifyListeners();
  }

  void setWindowPosition(Offset value) {
    _windowPosition = value;
    prefs.setDouble('windowPositionDx', value.dx);
    prefs.setDouble('windowPositionDy', value.dy);
  }
}
