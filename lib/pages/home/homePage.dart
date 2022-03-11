import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/clockPage.dart';
import 'package:smart_watch_widget/utils/generalScope.dart';
import 'package:window_manager/window_manager.dart';
import 'package:smart_watch_widget/state/appState.dart';
import 'package:system_theme/system_theme.dart';
import 'customScrollBehavior.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with WindowListener, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    hotKeyManager.unregisterAll();
    windowManager.removeListener(this);
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (WidgetsBinding.instance != null) {
      context
          .read<AppState>()
          .setBrightness(WidgetsBinding.instance!.window.platformBrightness);
    }

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      themeMode: ThemeMode.system,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        brightness: context.watch<AppState>().brightness,
        accentColor: SystemTheme.accentInstance.accent.toAccentColor(),
      ),
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Clock(),
    );
  }

  @override
  void onWindowFocus() {
    windowManager.setSkipTaskbar(false);
    context.read<AppState>().setWindowFocused(true);
    SystemTheme.accentInstance.load();
  }

  @override
  void onWindowBlur() {
    windowManager.setSkipTaskbar(true);
    context.read<AppState>().setWindowFocused(false);
    context.read<AppState>().setWindowPosition(appWindow.position);
  }
}
