import 'dart:io';
import 'dart:math';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/background/backgroundItem.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabayCategories.dart';

class BackgroundImageItem extends StatefulWidget {
  final String name;
  final Background backgroundType;
  final void Function() onPressed;

  const BackgroundImageItem({
    Key? key,
    required this.name,
    required this.backgroundType,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<BackgroundImageItem> createState() => _BackgroundImageItemState();
}

class _BackgroundImageItemState extends State<BackgroundImageItem>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  final fit = BoxFit.fill;
  final colorBlendMode = BlendMode.modulate;
  int randomOnlineImage = Random().nextInt(photosCategories.length);
  bool repeatedlyChangeOnlineImage = false;

  @override
  void initState() {
    super.initState();
    setAnimation();

    if (widget.backgroundType == Background.onlineImage) {
      repeatedlyChangeOnlineImage = true;
      changeOnlineImage();
    }
  }

  @override
  void dispose() {
    if (widget.backgroundType == Background.onlineImage) {
      repeatedlyChangeOnlineImage = false;
    }
    super.dispose();
  }

  Future<void> changeOnlineImage() async {
    while (repeatedlyChangeOnlineImage) {
      await Future.delayed(Duration(seconds: 3), () {
        if (repeatedlyChangeOnlineImage) {
          setState(() =>
              randomOnlineImage = Random().nextInt(photosCategories.length));
        }
      });
    }
  }

  void setAnimation() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 75), vsync: this);
    final curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween<double>(begin: 0.8, end: 0.9).animate(curve);
  }

  Image getImage() {
    var localImage = context.watch<AppState>().localImageBackground;
    var animatedColor = Colors.white.withOpacity(animation.value);

    if (widget.backgroundType == Background.onlineImage) {
      return Image.asset(
          'assets/images/${photosCategories[randomOnlineImage]}.jpg',
          fit: fit,
          color: animatedColor,
          colorBlendMode: colorBlendMode);
    } else if (widget.backgroundType == Background.localImage &&
        localImage != null) {
      return Image.file(File(localImage),
          fit: fit, color: animatedColor, colorBlendMode: colorBlendMode);
    } else {
      return Image.asset('assets/images/tulips-100_150.png',
          fit: fit, color: animatedColor, colorBlendMode: colorBlendMode);
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentBackgroundType = context.watch<AppState>().backgroundType;

    return MouseRegion(
      onEnter: (_) => controller.forward(),
      onExit: (_) => controller.reverse(),
      child: AnimatedSwitcher(
        duration: FluentTheme.of(context).slowAnimationDuration,
        transitionBuilder: (Widget child, Animation<double> animation) =>
            FadeTransition(opacity: animation, child: child),
        child: BackgroundItem(
          key: Key(randomOnlineImage.toString()),
          name: widget.name,
          background: AnimatedBuilder(
            animation: animation,
            builder: (_, __) => getImage(),
          ),
          isSelected: currentBackgroundType == widget.backgroundType,
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}
