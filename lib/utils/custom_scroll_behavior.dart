import 'dart:ui';
import 'package:fluent_ui/fluent_ui.dart';

class CustomScrollBehavior extends FluentScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

class CustomScrollBehaviorWithoutScrollBar extends CustomScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return Scrollbar(
      style: const ScrollbarThemeData(thickness: 0),
      controller: details.controller,
      child: child,
    );
  }
}
