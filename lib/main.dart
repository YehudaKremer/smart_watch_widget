import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:libmpv/libmpv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_watch_widget/state/clockSettingsState.dart';
import 'package:win_toast/win_toast.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/home/homePage.dart';
import 'package:system_theme/system_theme.dart';
import 'state/appState.dart';
import 'state/alarmClockState.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await hotKeyManager.unregisterAll();
  await SystemTheme.accentInstance.load();
  await Window.initialize();
  await MPV.initialize();
  await Window.setEffect(effect: WindowEffect.transparent);
  await WinToast.instance().initialize(
      appName: 'Smart Watch Widget',
      productName: '48434KremerSoftware.SmartWatchWidget',
      companyName: 'Kremer Software');

  var prefs = await SharedPreferences.getInstance();
  final appState = AppState(prefs);

  doWhenWindowReady(() {
    if (appState.windowPosition != null) {
      appWindow.position = appState.windowPosition!;
    } else {
      appWindow.alignment = Alignment.topRight;
    }
    appWindow.show();
    windowManager.focus();
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => appState),
        ChangeNotifierProvider(create: (_) => AlarmClockState(prefs)),
        ChangeNotifierProvider(create: (_) => ClockSettingsState(prefs)),
      ],
      child: HomePage(),
    ),
  );
}
