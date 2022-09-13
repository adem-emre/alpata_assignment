import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double setScaledWidth(double value) {
    return width * value;
  }

  double setScaledHeight(double value) {
    return height * value;
  }
}
