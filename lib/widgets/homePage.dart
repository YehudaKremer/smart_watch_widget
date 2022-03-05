import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:system_theme/system_theme.dart';
import '../customScrollBehavior.dart';
import 'clockPage.dart';
import 'layout.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      theme: ThemeData(
        brightness: context.watch<AppState>().brightness,
        accentColor: SystemTheme.accentInstance.accent.toAccentColor(),
      ),
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Layout(
        child: Clock(),
      ),
    );
  }

  @override
  void onWindowFocus() {
    Provider.of<AppState>(context, listen: false).setWindowFocused(true);
  }

  @override
  void onWindowBlur() {
    Provider.of<AppState>(context, listen: false).setWindowFocused(false);
  }
}
