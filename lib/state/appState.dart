import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';

const windowPositionDx = 'windowPositionDx';
const windowPositionDy = 'windowPositionDy';
const backgroundKey = 'background';
const localImageBackgroundKey = 'localImageBackground';
enum Background { empty, waves, localImage }

class AppState extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _isWindowFocused = true;
  String? _localImageBackground;
  Brightness _brightness = Brightness.dark;
  Background _background = Background.empty;
  Offset? _windowPosition;
  Offset? get windowPosition => _windowPosition;
  bool get isWindowFocused => _isWindowFocused;
  Brightness get brightness => _brightness;
  Background get background => _background;
  String? get localImageBackground => _localImageBackground;

  AppState(this.prefs) {
    _getWindowPosition();
    _getThemeMode();
    _getBackground();
  }

  _getWindowPosition() {
    final dx = prefs.getDouble(windowPositionDx);
    final dy = prefs.getDouble(windowPositionDy);
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
    prefs.setDouble(windowPositionDx, value.dx);
    prefs.setDouble(windowPositionDy, value.dy);
  }

  Future<void> _getBackground() async {
    var backgroundString = prefs.getString(backgroundKey);
    if (backgroundString != null && backgroundString.isNotEmpty) {
      _background = Background.values
          .firstWhere((e) => e.toString() == prefs.getString(backgroundKey));
      if (_background == Background.localImage) {
        var path = prefs.getString(localImageBackgroundKey);
        if (path != null && await File(path).exists()) {
          _localImageBackground = path;
        }
      }
      notifyListeners();
    }
  }

  Future<void> setBackground(Background background,
      {String? localImage}) async {
    _background = background;
    if (localImage != null &&
        localImage.isNotEmpty &&
        await File(localImage).exists()) {
      _localImageBackground = localImage;
      prefs.setString(localImageBackgroundKey, localImage);
    }
    notifyListeners();
    prefs.setString(backgroundKey, background.toString());
  }
}
