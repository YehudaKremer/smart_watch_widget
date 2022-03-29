import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarm.dart';
import 'package:smart_watch_widget/pages/alarmClock/alarmClockState.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:smart_watch_widget/utils/customScrollBehavior.dart';
import 'package:smart_watch_widget/utils/navigator.dart';

class AlarmMessageDialog extends StatefulWidget {
  final Alarm alarm;
  final bool isExistedAlarm;

  AlarmMessageDialog({
    Key? key,
    required this.alarm,
    required this.isExistedAlarm,
  }) : super(key: key);

  @override
  State<AlarmMessageDialog> createState() => _AlarmMessageDialogState();
}

class _AlarmMessageDialogState extends State<AlarmMessageDialog> {
  final messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    messageController.text = widget.alarm.message ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          color:
              FluentTheme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
          child: ContentDialog(
            content: Column(
              children: [
                ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
                  child: TextBox(
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
                ),
                Tooltip(
                  message:
                      "Read the message (Text To Speech) when the alarm is on.\nFor now: Works only for english.",
                  child: ToggleSwitch(
                    checked: widget.alarm.readMessage,
                    onChanged: (v) {
                      setState(() {
                        widget.alarm.readMessage = v;
                      });
                    },
                    content: Text('Read Message'),
                  ),
                )
              ],
            ),
            constraints: BoxConstraints(
                maxWidth: context.read<AppState>().watchSize - 50),
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
                        onPressed: () {
                          widget.alarm.message = messageController.text.trim();
                          if (widget.isExistedAlarm) {
                            context
                                .read<AlarmClockState>()
                                .updateAlarm(widget.alarm);
                          }
                          navigatorPop(context);
                        }),
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
        ),
      ),
    );
  }
}
