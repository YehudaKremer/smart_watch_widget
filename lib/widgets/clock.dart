import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../appState.dart';
import 'menu/menu.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<AppState>(context, listen: false).setMenuOpen(true);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Menu()),
        );
      },
      child: AnalogClock(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        textScaleFactor: 1.4,
        showAllNumbers: true,
      ),
    );
  }
}
