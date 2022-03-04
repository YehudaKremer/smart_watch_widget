import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:system_theme/system_theme.dart';
import '../customScrollBehavior.dart';
import 'clockPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipOval(
        child: FluentApp(
          theme: ThemeData(
            brightness: context.watch<AppState>().brightness,
            accentColor: SystemTheme.accentInstance.accent.toAccentColor(),
          ),
          scrollBehavior: CustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          home: Clock(),
        ),
      ),
    );
  }
}
