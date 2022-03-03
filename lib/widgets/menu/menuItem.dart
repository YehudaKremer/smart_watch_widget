import 'package:flutter/material.dart';
import 'dart:math';
import '../../colors/linear_gradient_style.dart';

class MenuItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function()? onPressed;

  const MenuItem(
      {Key? key, required this.name, required this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var randomGradient = LinearGradientStyle.linearGradient(
      orientation: LinearGradientStyle.ORIENTATION_VERTICAL,
      gradientType: Random(name.hashCode).nextInt(334),
    );
    var gradient = LinearGradient(
      begin: Alignment(-1.0, -2.0),
      end: Alignment(1.0, 2.0),
      colors: [randomGradient.colors[1], randomGradient.colors[0]],
    );

    return ClipOval(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradient,
        ),
        child: RawMaterialButton(
          padding: EdgeInsets.all(6),
          shape: CircleBorder(),
          elevation: 10,
          child: Icon(
            icon,
            size: 32,
            color: Colors.white,
          ),
          onPressed: onPressed ?? () {},
        ),
      ),
    );
  }
}
