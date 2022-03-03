import 'package:analog_clock/analog_clock.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:provider/provider.dart';

import 'appState.dart';
import 'customScrollBehavior.dart';
import 'widgets/clock.dart';

const initialSize = Size(250, 250);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const Main(),
    ),
  );
  doWhenWindowReady(() {
    appWindow.maxSize = appWindow.minSize = appWindow.size = initialSize;
    appWindow.alignment = Alignment.centerRight;
    appWindow.show();
  });
  await Window.setEffect(
    effect: WindowEffect.transparent,
  );
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipOval(
        child: MaterialApp(
          scrollBehavior: CustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          home: Clock(),
        ),
      ),
    );
  }
}
