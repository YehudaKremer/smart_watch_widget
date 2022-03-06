import 'package:fluent_ui/fluent_ui.dart';

import '../layout.dart';
import '../menu/menuItem.dart';

class AlarmClockFrom extends StatefulWidget {
  const AlarmClockFrom({Key? key}) : super(key: key);

  @override
  State<AlarmClockFrom> createState() => _AlarmClockFromState();
}

class _AlarmClockFromState extends State<AlarmClockFrom> {
  DateTime date = DateTime.now();
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DatePicker(
              header: 'Date',
              popupHeight: 220,
              selected: date,
              showYear: false,
              onChanged: (v) => setState(() => date = v),
            ),
            Container(height: 10),
            TimePicker(
              popupHeight: 220,
              header: 'Time',
              selected: date,
              onChanged: (v) => setState(() => time = v),
            ),
            Container(height: 10),
            Row(
              children: [
                Expanded(
                  child: MenuItem(
                    name: 'Save',
                    icon: FluentIcons.accept,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: MenuItem(
                    name: 'Cancel',
                    icon: FluentIcons.cancel,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
