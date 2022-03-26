import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';
import 'package:win32/win32.dart';
import 'package:window_manager/window_manager.dart';

const watchSizeKey = 'watchSize';
const defaultWatchSize = 250.0;
const windowPositionDxKey = 'windowPositionDx';
const windowPositionDyKey = 'windowPositionDy';
const backgroundKey = 'background';
const localImageBackgroundKey = 'localImageBackground';
enum Background { empty, waves, localImage, onlineImage }

class AppState extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _isWindowFocused = true;
  String? _localImageBackground;
  Brightness _brightness = Brightness.dark;
  Background _backgroundType = Background.empty;
  double _watchSize = defaultWatchSize;
  Offset? _windowPosition;
  Offset? get windowPosition => _windowPosition;
  double get watchSize => _watchSize;
  bool get isWindowFocused => _isWindowFocused;
  Brightness get brightness => _brightness;
  Background get backgroundType => _backgroundType;
  String? get localImageBackground => _localImageBackground;

  AppState(this.prefs) {
    _getWindowPosition();
    _getWindowSize();
    _getThemeMode();
    _getBackground();
  }

  _getWindowPosition() {
    final size = prefs.getDouble(watchSizeKey);

    if (size != null && size != _watchSize) {
      _watchSize = size;
      setWatchSize(size);
    }
  }

  _getWindowSize() {
    final dx = prefs.getDouble(windowPositionDxKey);
    final dy = prefs.getDouble(windowPositionDyKey);
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

  setWatchSize(double size) {
    _watchSize = size;
    windowManager.setSize(Size(size, size));
    notifyListeners();
    prefs.setDouble(watchSizeKey, size);
  }

  resetAll() {
    setWatchSize(250);
  }

  void setWindowFocused(bool value) {
    _isWindowFocused = value;
    notifyListeners();
  }

  void setWindowPosition(Offset position) {
    final screenWidth = GetSystemMetrics(SM_CXSCREEN);
    final screenHeight = GetSystemMetrics(SM_CYSCREEN);

    if (position.dx + watchSize > screenWidth ||
        position.dy + watchSize > screenHeight) {
      double dx = position.dx + watchSize > screenWidth
          ? screenWidth - watchSize
          : position.dx;
      double dy = position.dy + watchSize > screenHeight
          ? screenHeight - watchSize
          : position.dy;

      windowManager.setPosition(_windowPosition = Offset(dx, dy));
    } else {
      _windowPosition = position;
    }

    prefs.setDouble(windowPositionDxKey, _windowPosition!.dx);
    prefs.setDouble(windowPositionDyKey, _windowPosition!.dy);
  }

  Future<void> _getBackground() async {
    var backgroundString = prefs.getString(backgroundKey);
    if (backgroundString != null && backgroundString.isNotEmpty) {
      _backgroundType = Background.values
          .firstWhere((e) => e.toString() == prefs.getString(backgroundKey));
      if (_backgroundType == Background.localImage) {
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
    _backgroundType = background;
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
