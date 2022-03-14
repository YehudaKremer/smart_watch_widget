import 'package:fluent_ui/fluent_ui.dart';

class AlarmMessageDialog extends StatelessWidget {
  final String message;
  final messageController = TextEditingController();

  AlarmMessageDialog({Key? key, required this.message}) : super(key: key) {
    messageController.text = message;
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            color: FluentTheme.of(context)
                .scaffoldBackgroundColor
                .withOpacity(0.6),
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.height / 2)),
          ),
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
                      onPressed: () =>
                          Navigator.pop(context, messageController.text),
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
        ),
      ),
    );
  }
}
