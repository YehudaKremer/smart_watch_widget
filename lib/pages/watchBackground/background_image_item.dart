import 'dart:io';
import 'dart:math';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/watchBackground/background_item.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabay_categories.dart';

class BackgroundImageItem extends StatefulWidget {
  final String name;
  final void Function() onPressed;
  final String? backgroundImagePath;
  final TextStyle? nameTextStyle;
  final Background backgroundType;

  const BackgroundImageItem({
    Key? key,
    required this.name,
    required this.backgroundType,
    required this.onPressed,
    this.backgroundImagePath,
    this.nameTextStyle,
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
    controller.dispose();
    super.dispose();
  }

  Future<void> changeOnlineImage() async {
    while (repeatedlyChangeOnlineImage) {
      await Future.delayed(const Duration(seconds: 3), () {
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
        localImage != null &&
        widget.backgroundImagePath == null) {
      return Image.file(File(localImage),
          fit: fit, color: animatedColor, colorBlendMode: colorBlendMode);
    } else {
      return Image.asset(
          widget.backgroundImagePath ?? 'assets/images/tulips-100_150.png',
          fit: widget.backgroundImagePath != null ? BoxFit.cover : fit,
          color: animatedColor,
          colorBlendMode: colorBlendMode);
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
          isSelected: widget.backgroundImagePath == null &&
              currentBackgroundType == widget.backgroundType,
          onPressed: widget.onPressed,
          nameTextStyle: widget.nameTextStyle,
        ),
      ),
    );
  }
}
