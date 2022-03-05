import 'package:flutter/cupertino.dart';
import 'package:system_theme/system_theme.dart';

const initialSize = Size(250, 250);

class AppState extends ChangeNotifier {
  bool _isWindowFocused = false;
  bool _isMenuOpen = false;
  bool get isMenuOpen => _isMenuOpen;
  bool get isWindowFocused => _isWindowFocused;
  Brightness brightness = Brightness.dark;

  AppState() {
    getDarkMode();
  }

  getDarkMode() {
    SystemTheme.darkMode.then((isDarkMode) {
      brightness = isDarkMode ? Brightness.dark : Brightness.light;
      notifyListeners();
    });
  }

  void setMenuOpen(bool value) {
    _isMenuOpen = value;
    notifyListeners();
  }

  void setWindowFocused(bool value) {
    _isWindowFocused = value;
    notifyListeners();
  }
}
