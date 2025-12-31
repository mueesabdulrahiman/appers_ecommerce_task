import 'package:flutter/material.dart';

class AppColors {

  // product description color
  static Color desColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.grey.shade500
      : Colors.grey.shade700;

  // Button color
  static Color buttonColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.grey.shade700
      : Colors.black;

  // navaBar
  static Color navBarSelected(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.white
      : Colors.black;

  static Color navBarUnSelected(BuildContext context) => Colors.grey.shade600;
}
