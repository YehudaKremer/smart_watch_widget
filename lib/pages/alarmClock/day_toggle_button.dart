import 'package:fluent_ui/fluent_ui.dart';

class DayToggleButton extends StatelessWidget {
  final String day;
  final bool selected;
  final Function(bool) onToggle;

  const DayToggleButton(
      {Key? key,
      required this.day,
      required this.selected,
      required this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: day,
      child: SizedBox(
        width: 32,
        child: ToggleButton(
          checked: selected,
          onChanged: (value) => onToggle(value),
          child: Text(day.substring(0, 1)),
        ),
      ),
    );
  }
}
