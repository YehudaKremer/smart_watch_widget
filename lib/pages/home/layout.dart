import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/utils/animations.dart';
import 'package:smart_watch_widget/utils/hotKeys.dart';
import 'package:smart_watch_widget/state/appState.dart';
import 'package:smart_watch_widget/widgets/waves.dart';

class Layout extends StatelessWidget {
  final Widget child;
  Layout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    registerGeneralHotKeys(context);
    var background = context.watch<AppState>().background;
    var localImageBackground = context.watch<AppState>().localImageBackground;

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
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.height / 2)),
            ),
            child: ClipOval(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedSlideFade(
                    child: background == Background.waves
                        ? Waves()
                        : background == Background.localImage &&
                                localImageBackground != null
                            ? Container(
                                constraints: BoxConstraints.expand(),
                                child: Image.file(File(localImageBackground),
                                    fit: BoxFit.fitHeight,
                                    color: Colors.white.withOpacity(0.9),
                                    colorBlendMode: BlendMode.modulate),
                              )
                            : Container(),
                  ),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
