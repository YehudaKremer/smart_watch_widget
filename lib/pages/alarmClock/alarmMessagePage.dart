import 'package:fluent_ui/fluent_ui.dart';
import 'package:smart_watch_widget/models/alarm.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';

class AlarmMessage extends StatelessWidget {
  final Alarm alarm;
  final void Function() onDismiss;
  final messageController = TextEditingController();

  AlarmMessage({Key? key, required this.alarm, required this.onDismiss})
      : super(key: key) {
    messageController.text = alarm.message ?? '';
  }

  void submitAlarmMessage(BuildContext context) {
    alarm.message = messageController.text;
    onDismiss();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tooltip(
                message: 'Save',
                child: IconButton(
                  icon: Icon(FluentIcons.accept),
                  onPressed: () => submitAlarmMessage(context),
                ),
              ),
              Container(width: 10),
              Tooltip(
                message: 'Cancel',
                child: IconButton(
                  icon: Icon(FluentIcons.cancel),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
