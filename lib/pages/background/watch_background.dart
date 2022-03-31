import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/utils/animations.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:smart_watch_widget/widgets/waves.dart';

class WatchBackground extends StatelessWidget {
  const WatchBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            ? const Waves()
            : background == Background.localImage &&
                    localImageBackground != null
                ? Container(
                    constraints: const BoxConstraints.expand(),
                    child: Image.file(File(localImageBackground),
                        fit: BoxFit.cover,
                        color: Colors.white.withOpacity(0.9),
                        colorBlendMode: BlendMode.modulate),
                  )
                : background == Background.onlineImage &&
                        onlineImageBackground != null
                    ? Container(
                        constraints: const BoxConstraints.expand(),
                        child: Image.file(File(onlineImageBackground),
                            fit: BoxFit.cover,
                            color: Colors.white.withOpacity(0.9),
                            colorBlendMode: BlendMode.modulate),
                      )
                    : Container(),
      ),
    );
  }
}
