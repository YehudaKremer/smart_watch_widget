import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/utils/animations.dart';
import 'package:smart_watch_widget/utils/hotKeys.dart';
import 'package:smart_watch_widget/state/appState.dart';
import 'package:smart_watch_widget/widgets/waves.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.height / 2)),
            ),
            child: ClipOval(
              child: Stack(
                children: [
                  AnimatedSlideFade(
                    child:
                        context.watch<AppState>().background == Background.waves
                            ? Waves()
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
