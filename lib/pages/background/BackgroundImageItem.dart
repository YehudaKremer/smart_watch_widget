import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/background/backgroundItem.dart';
import 'package:smart_watch_widget/state/appState.dart';

class BackgroundImageItem extends StatefulWidget {
  final bool isSelected;
  final void Function() onPressed;

  const BackgroundImageItem(
      {Key? key, required this.isSelected, required this.onPressed})
      : super(key: key);

  @override
  State<BackgroundImageItem> createState() => _BackgroundImageItemState();
}

class _BackgroundImageItemState extends State<BackgroundImageItem>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 75), vsync: this);
    final Animation<double> curve =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween<double>(begin: 0.8, end: 0.9).animate(curve);
  }

  final fit = BoxFit.fill;
  final colorBlendMode = BlendMode.modulate;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => controller.forward(),
      onExit: (_) => controller.reverse(),
      child: BackgroundItem(
        name: 'Image',
        background: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return context.watch<AppState>().background ==
                        Background.localImage &&
                    context.watch<AppState>().localImageBackground != null
                ? Image.file(
                    File(context.watch<AppState>().localImageBackground!),
                    fit: fit,
                    color: Colors.white.withOpacity(animation.value),
                    colorBlendMode: colorBlendMode)
                : Image.asset('assets/images/tulips-100_150.png',
                    fit: fit,
                    color: Colors.white.withOpacity(animation.value),
                    colorBlendMode: colorBlendMode);
          },
        ),
        isSelected: widget.isSelected,
        onPressed: widget.onPressed,
      ),
    );
  }
}
