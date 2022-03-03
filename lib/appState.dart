import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  bool _isMenuOpen = false;
  bool get isMenuOpen => _isMenuOpen;

  void setMenuOpen(bool value) {
    _isMenuOpen = value;
    notifyListeners();
  }
}
