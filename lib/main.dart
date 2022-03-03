import 'package:analog_clock/analog_clock.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

const initialSize = Size(250, 250);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  runApp(const MyApp());
  doWhenWindowReady(() {
    appWindow.maxSize = appWindow.minSize = appWindow.size = initialSize;
    appWindow.show();
  });
  await Window.setEffect(
    effect: WindowEffect.transparent,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipOval(
          child: AnalogClock(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            textScaleFactor: 1.4,
            showAllNumbers: true,
          ),
        ),
      ),
    );
  }
}
