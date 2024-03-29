import 'dart:async';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:smart_watch_widget/utils/custom_scroll_behavior.dart';
import 'package:smart_watch_widget/utils/general_scope.dart';
import 'package:window_manager/window_manager.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:system_theme/system_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with WindowListener, WidgetsBindingObserver {
  Timer? _debounceWindowMoves;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    hotKeyManager.unregisterAll();
    windowManager.removeListener(this);
    WidgetsBinding.instance.removeObserver(this);
    _debounceWindowMoves?.cancel();
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    context.read<AppState>().setBrightness(
        WidgetsBinding.instance.platformDispatcher.platformBrightness);

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      themeMode: ThemeMode.system,
      navigatorKey: navigatorKey,
      theme: FluentThemeData(
          brightness: context.watch<AppState>().brightness,
          accentColor: SystemTheme.accentColor.accent.toAccentColor(),
          scaffoldBackgroundColor:
              context.watch<AppState>().brightness == Brightness.dark
                  ? const Color.fromRGBO(25, 25, 25, 1)
                  : const Color.fromRGBO(255, 255, 255, 1)),
      scrollBehavior: CustomScrollBehaviorWithoutScrollBar(),
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        SentryNavigatorObserver(),
      ],
      home: Container(),
    );
  }

  @override
  void onWindowFocus() {
    windowManager.setSkipTaskbar(false);
    context.read<AppState>().setWindowFocused(true);
    SystemTheme.accentColor.load();
  }

  @override
  void onWindowBlur() {
    windowManager.setSkipTaskbar(true);
    context.read<AppState>().setWindowFocused(false);
  }

  @override
  Future<void> onWindowMove() async {
    if (_debounceWindowMoves?.isActive ?? false) _debounceWindowMoves?.cancel();
    _debounceWindowMoves = Timer(const Duration(milliseconds: 250), () async {
      context
          .read<AppState>()
          .setWindowPosition(await windowManager.getPosition());
    });
  }
}
