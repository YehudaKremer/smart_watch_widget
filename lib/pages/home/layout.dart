import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/utils/animations.dart';
import 'package:smart_watch_widget/utils/hotKeys.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:smart_watch_widget/widgets/waves.dart';

class Layout extends StatelessWidget {
  final Widget child;
  Layout({Key? key, required this.child}) : super(key: key);

  BackgroundImage(BuildContext context) {
    var background = context.watch<AppState>().backgroundType;
    var localImageBackground = context.watch<AppState>().localImageBackground;
    var onlineImageBackground = context.watch<AppState>().onlineImageBackground;

    return AnimatedSwitcher(
      duration: FluentTheme.of(context).slowAnimationDuration,
      transitionBuilder: (innerChild, animation) => SlideFadeTransition(
        animation: animation,
        child: innerChild,
      ),
      child: Container(
        key: Key(
            'background-$background-$localImageBackground-$onlineImageBackground'),
        child: background == Background.waves
            ? Waves()
            : background == Background.localImage &&
                    localImageBackground != null
                ? Container(
                    constraints: BoxConstraints.expand(),
                    child: Image.file(File(localImageBackground),
                        fit: BoxFit.cover,
                        color: Colors.white.withOpacity(0.9),
                        colorBlendMode: BlendMode.modulate),
                  )
                : background == Background.onlineImage &&
                        onlineImageBackground != null
                    ? Container(
                        constraints: BoxConstraints.expand(),
                        child: Image.file(File(onlineImageBackground),
                            fit: BoxFit.cover,
                            color: Colors.white.withOpacity(0.9),
                            colorBlendMode: BlendMode.modulate),
                      )
                    : Container(),
      ),
    );
  }

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
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.height / 2)),
            ),
            child: ClipOval(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  BackgroundImage(context),
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
