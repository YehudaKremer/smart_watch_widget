import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';

const initialSize = Size(250, 250);

class AppState extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _isWindowFocused = false;
  Offset? _windowPosition;
  Offset? get windowPosition => _windowPosition;
  bool get isWindowFocused => _isWindowFocused;
  Brightness brightness = Brightness.dark;

  AppState(this.prefs) {
    _getWindowPosition();
    getDarkMode();
  }

  _getWindowPosition() {
    final dx = prefs.getDouble('windowPositionDx');
    final dy = prefs.getDouble('windowPositionDy');
    if (dx != null || dy != null) _windowPosition = Offset(dx ?? 0, dy ?? 0);
  }

  getDarkMode() {
    SystemTheme.darkMode.then((isDarkMode) {
      brightness = isDarkMode ? Brightness.dark : Brightness.light;
      SystemTheme.accentInstance.load().then((_) => notifyListeners());
    });
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
