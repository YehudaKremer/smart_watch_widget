import 'dart:async';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/clock_page.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/utils/custom_scroll_behavior.dart';
import 'package:smart_watch_widget/utils/general_scope.dart';
import 'package:window_manager/window_manager.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:system_theme/system_theme.dart';

import '../menu/menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
    context
        .read<AppState>()
        .setBrightness(WidgetsBinding.instance.window.platformBrightness);

    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      themeMode: ThemeMode.system,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        brightness: context.watch<AppState>().brightness,
        accentColor: SystemTheme.accentColor.accent.toAccentColor(),
      ),
      scrollBehavior: CustomScrollBehaviorWithoutScrollBar(),
      debugShowCheckedModeBanner: false,
      home: const Layout(
        child: ClockPage(navigateOnTap: MenuPage()),
      ),
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
