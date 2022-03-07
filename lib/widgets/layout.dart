import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

import '../appState.dart';
import '../hotKeys.dart';

class Layout extends StatelessWidget {
  final Widget child;
  Layout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    registerGeneralHotKeys(context);

    return Padding(
      padding: const EdgeInsets.all(2),
      child: ClipOval(
        child: ScaffoldPage(
          padding: const EdgeInsets.all(0),
          content: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.watch<AppState>().isWindowFocused
                    ? FluentTheme.of(context).accentColor
                    : FluentTheme.of(context).shadowColor.withOpacity(0.4),
                width: 1.4,
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(initialSize.width / 2)),
            ),
            child: ClipOval(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
