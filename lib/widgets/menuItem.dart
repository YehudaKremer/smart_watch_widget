import 'package:fluent_ui/fluent_ui.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final Widget? infoBadgeSource;
  final Function()? onPressed;

  const MenuItem(
      {Key? key,
      required this.title,
      required this.icon,
      this.color,
      this.onPressed,
      this.infoBadgeSource})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: title,
      triggerMode: TooltipTriggerMode.longPress,
      child: IconButton(
        style: ButtonStyle(
          iconSize: ButtonState.all(
              FluentTheme.of(context).typography.title!.fontSize),
          foregroundColor: ButtonState.all(color),
        ),
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Icon(icon),
            infoBadgeSource != null
                ? Positioned(
                    right: 0,
                    top: 0,
                    child: InfoBadge(
                      source: infoBadgeSource,
                    ),
                  )
                : Container(),
          ],
        ),
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
