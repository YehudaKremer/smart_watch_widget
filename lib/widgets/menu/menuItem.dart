import 'package:fluent_ui/fluent_ui.dart';

class MenuItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color? color;
  final Function()? onPressed;

  const MenuItem(
      {Key? key,
      required this.name,
      required this.icon,
      this.color,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: name,
      triggerMode: TooltipTriggerMode.longPress,
      child: IconButton(
        style: ButtonStyle(
          iconSize: ButtonState.all(
              FluentTheme.of(context).typography.title!.fontSize),
          foregroundColor: ButtonState.all(color),
        ),
        icon: Icon(icon),
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
