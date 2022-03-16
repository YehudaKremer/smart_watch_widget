import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/background/backgroundItem.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/pages/menu/menuItem.dart';
import 'package:smart_watch_widget/state/appState.dart';
import 'package:smart_watch_widget/widgets/waves.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: [
            MenuItem(
              title: 'Go Back',
              icon: FluentIcons.back,
              onPressed: () => Navigator.pop(context),
            ),
            Container(height: 10),
            Expanded(
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: [
                  BackgroundItem(
                    name: 'Empty',
                    background: Icon(
                      FluentIcons.blocked,
                      size: 50,
                      color: FluentTheme.of(context)
                          .typography
                          .body!
                          .color!
                          .withOpacity(0.2),
                    ),
                    isSelected: context.watch<AppState>().background ==
                        Background.empty,
                    onPressed: () {
                      context.read<AppState>().setBackground(Background.empty);
                    },
                  ),
                  BackgroundItem(
                    name: 'Waves',
                    background: Waves(),
                    isSelected: context.watch<AppState>().background ==
                        Background.waves,
                    onPressed: () {
                      context.read<AppState>().setBackground(Background.waves);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
