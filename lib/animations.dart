import 'package:fluent_ui/fluent_ui.dart';

class SizeFadeTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> animation;

  const SizeFadeTransition({
    Key? key,
    required this.animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}

class SlideFadeTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> animation;

  const SlideFadeTransition({
    Key? key,
    required this.animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ),
      ),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
