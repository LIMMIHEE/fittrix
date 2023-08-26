import 'package:flutter/material.dart';

class Utils {
  static showSnackBar(BuildContext context, String text, {margin}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 2000),
      content: Text(text),
      margin: margin,
    ));
  }
}
