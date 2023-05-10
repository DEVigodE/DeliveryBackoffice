import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenShortestSide => MediaQuery.of(this).size.shortestSide;
  double get screenLongestSide => MediaQuery.of(this).size.longestSide;
  double percentHeight(double percent) => screenHeight * percent / 100;
  double percentWidth(double percent) => screenWidth * percent / 100;
}
