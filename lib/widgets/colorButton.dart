import 'package:fluent_ui/fluent_ui.dart';

class ColorButton extends StatefulWidget {
  final double top;
  final double left;
  final double size;
  final Color color;
  final String tooltip;
  final void Function() onTap;

  const ColorButton({
    Key? key,
    required this.top,
    required this.left,
    required this.size,
    required this.color,
    required this.tooltip,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  late double width = widget.size, height = widget.size;
  late Color color = widget.color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      child: Container(
        alignment: Alignment.center,
        width: widget.size * 1.1,
        height: widget.size * 1.1,
        child: Tooltip(
          message: widget.tooltip,
          child: ClipOval(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onHover: (_) {
                setState(() {
                  color = color.withOpacity(0.85);
                  width = widget.size * 1.1;
                  height = widget.size * 1.1;
                });
              },
              onExit: (_) {
                setState(() {
                  color = color.withOpacity(1);
                  width = widget.size;
                  height = widget.size;
                });
              },
              child: GestureDetector(
                onTap: widget.onTap,
                child: AnimatedContainer(
                  duration: FluentTheme.of(context).fastAnimationDuration,
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(width / 2),
                    border: Border.all(
                      color: FluentTheme.of(context).typography.body!.color!,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
