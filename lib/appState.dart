import 'package:flutter/cupertino.dart';
import 'package:system_theme/system_theme.dart';

class AppState extends ChangeNotifier {
  bool _isMenuOpen = false;
  bool get isMenuOpen => _isMenuOpen;
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
}
