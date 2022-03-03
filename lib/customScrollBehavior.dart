import 'dart:ui';
import 'package:fluent_ui/fluent_ui.dart';

class CustomScrollBehavior extends FluentScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };

  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return Scrollbar(
      style: ScrollbarThemeData(thickness: 0),
      controller: details.controller,
      child: child,
    );
  }
}
