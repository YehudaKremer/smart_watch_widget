import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
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
import 'pages/clock_page.dart';
import 'pages/home/layout.dart';
import 'pages/menu/menu_page.dart';
import 'utils/general_scope.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await hotKeyManager.unregisterAll();
  await SystemTheme.accentColor.load();
  await WinToast.instance().initialize(
      aumId: '48434KremerSoftware.SmartWatchWidget',
      displayName: 'Smart Watch Widget',
      iconPath: '',
      clsid: 'fce91c93-8cbd-443d-b1c0-66d4ba8788c7');

  var prefs = await SharedPreferences.getInstance();
  final appState = AppState(prefs);

  windowManager.waitUntilReadyToShow(null, () async {
    await windowManager.show();
    await windowManager.setPosition(appState.windowPosition);
    await windowManager.setBackgroundColor(Colors.transparent);
    Navigator.push(
      navigatorKey.currentContext!,
      FluentPageRoute(
        builder: (context) => const Layout(
          child: ClockPage(navigateOnTap: MenuPage()),
        ),
        settings: const RouteSettings(name: 'MenuPage'),
      ),
    );
  });

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://4c791229b1d943c4a21dc50374950de8@o554512.ingest.sentry.io/4505243108573184';
    },
    appRunner: () => runApp(
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
    ),
  );
}
