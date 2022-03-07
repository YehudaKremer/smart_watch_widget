import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';

const initialSize = Size(250, 250);

class AppState extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _isWindowFocused = false;
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

  Future<void> setWindowPosition(Offset value) async {
    _windowPosition = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('windowPositionDx', value.dx);
    await prefs.setDouble('windowPositionDy', value.dy);
  }
}
