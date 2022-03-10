import 'package:fluent_ui/fluent_ui.dart';
import 'package:smart_watch_widget/models/alarm.dart';

class AlarmMessage extends StatelessWidget {
  final Alarm alarm;
  final void Function() onDismiss;
  final messageController = TextEditingController();

  AlarmMessage({Key? key, required this.alarm, required this.onDismiss})
      : super(key: key) {
    messageController.text = alarm.message ?? '';
  }

  void submitAlarmMessage() {
    alarm.message = messageController.text;
    onDismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Acrylic(
      child: ContentDialog(
        content: TextBox(
          autofocus: true,
          controller: messageController,
          placeholder: 'Type alarm message',
          maxLines: 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
            ),
          ),
          placeholderStyle:
              TextStyle(color: FluentTheme.of(context).disabledColor),
        ),
        constraints: const BoxConstraints(maxWidth: 200, maxHeight: 100),
        style: ContentDialogThemeData(
          padding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          actionsSpacing: 0,
        ),
        actions: [
          Center(
            child: IconButton(
              icon: Icon(FluentIcons.accept),
              onPressed: submitAlarmMessage,
            ),
          ),
        ],
      ),
    );
  }
}
