import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class MenuItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color? color;
  final Function()? onPressed;
  final SystemMouseCursor? cursor;

  const MenuItem(
      {Key? key,
      required this.name,
      required this.icon,
      this.color,
      this.onPressed,
      this.cursor})
      : super(key: key);

  Widget getIconButton() {
    var normalIconButton = IconButton(
      style: ButtonStyle(
        iconSize: ButtonState.all(24),
        foregroundColor: ButtonState.all(color),
      ),
      icon: Icon(icon),
      onPressed: onPressed ?? () {},
    );

    var moveWindowIconButton = MoveWindow(
      child: SizedBox(
        width: 52,
        child: normalIconButton,
      ),
    );

    return cursor == SystemMouseCursors.move
        ? moveWindowIconButton
        : normalIconButton;
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: name,
      triggerMode: TooltipTriggerMode.longPress,
      child: MouseRegion(
        cursor: cursor ?? SystemMouseCursors.basic,
        child: getIconButton(),
      ),
    );
  }
}

// SizedBox(
//         height: splitButtonHeight,
//         child:


// ClipOval(
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: gradient,
//         ),
//         child: