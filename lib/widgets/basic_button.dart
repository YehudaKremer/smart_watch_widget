import 'package:fluent_ui/fluent_ui.dart';

class BasicButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final Function()? onPressed;

  const BasicButton(
      {Key? key,
      required this.title,
      required this.icon,
      this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Tooltip(
        message: title,
        triggerMode: TooltipTriggerMode.longPress,
        child: Button(
          style: ButtonStyle(
            iconSize: ButtonState.all(
                FluentTheme.of(context).typography.subtitle!.fontSize),
            foregroundColor: ButtonState.all(color),
          ),
          onPressed: onPressed,
          child: Icon(icon),
        ),
      ),
    );
  }
}
