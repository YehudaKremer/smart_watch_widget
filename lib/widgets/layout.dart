import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:system_theme/system_theme.dart';

import '../appState.dart';

class Layout extends StatelessWidget {
  final Widget child;
  Layout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: ClipOval(
        child: ScaffoldPage(
          padding: const EdgeInsets.all(0),
          content: Consumer<AppState>(
            builder: (context, state, _) => Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: state.isWindowFocused
                      ? FluentTheme.of(context).accentColor
                      : FluentTheme.of(context).shadowColor.withOpacity(0.4),
                  width: 1.2,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(initialSize.width / 2)),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
