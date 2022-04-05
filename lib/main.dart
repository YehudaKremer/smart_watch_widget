import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_watch_widget/pages/clockSettings/clock_settings_state.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabay_api_state.dart';
import 'package:win_toast/win_toast.dart';
import 'package:window_manager/window_manager.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/home/home_page.dart';
import 'package:system_theme/system_theme.dart';
import 'app_state.dart';
import 'pages/alarmClock/alarm_clock_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await hotKeyManager.unregisterAll();
  await SystemTheme.accentColor.load();
  await WinToast.instance().initialize(
      appName: 'Smart Watch Widget',
      productName: '48434KremerSoftware.SmartWatchWidget',
      companyName: 'Kremer Software');

  var prefs = await SharedPreferences.getInstance();
  final appState = AppState(prefs);

  windowManager.setPosition(appState.windowPosition);
  windowManager.setBackgroundColor(Colors.transparent);
  windowManager.show();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => appState),
        ChangeNotifierProvider(
          create: (_) => AlarmClockState(prefs),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => ClockSettingsState(prefs)),
        ChangeNotifierProvider(create: (_) => PixabayApiState(prefs))
      ],
      child: const HomePage(),
    ),
  );
}
