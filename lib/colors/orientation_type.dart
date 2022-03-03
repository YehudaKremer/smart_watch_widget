import 'package:flutter/material.dart';

class OrientationType {
  /// Returns offset of Gradient
  FractionalOffset offsetEnd(int orientation) {
    FractionalOffset fractionalOffset;
    if (orientation == 0001) {
      fractionalOffset = FractionalOffset(0.0, 1.0);
    } else if (orientation == 0002) {
      fractionalOffset = FractionalOffset(1.0, 0.0);
    } else {
      fractionalOffset = FractionalOffset(1.0, 0.0);
    }
    return fractionalOffset;
  }
}
