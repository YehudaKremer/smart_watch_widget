import 'package:fluent_ui/fluent_ui.dart';

void navigatorPop(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}
