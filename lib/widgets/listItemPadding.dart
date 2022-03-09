import 'package:fluent_ui/fluent_ui.dart';

class ListItemPadding extends StatelessWidget {
  final Widget child;
  const ListItemPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: child,
    );
  }
}
