import 'package:fluent_ui/fluent_ui.dart';
import 'package:smart_watch_widget/utils/animations.dart';

class BackgroundItem extends StatelessWidget {
  final String name;
  final Widget background;
  final bool isSelected;
  final void Function() onPressed;
  final TextStyle? nameTextStyle;

  const BackgroundItem({
    Key? key,
    required this.name,
    required this.background,
    required this.isSelected,
    required this.onPressed,
    this.nameTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      style: ButtonStyle(
        padding: ButtonState.all(EdgeInsets.zero),
      ),
      onPressed: onPressed,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            child: background,
          ),
          Center(
            child: SizedBox(
              width: 60,
              height: 44,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  name,
                  style: (nameTextStyle ??
                          FluentTheme.of(context).typography.body!)
                      .copyWith(color: Colors.white.withOpacity(0.9)),
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: AnimatedSlideFade(
              child: isSelected
                  ? const InfoBadge(
                      source: Icon(FluentIcons.accept),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
