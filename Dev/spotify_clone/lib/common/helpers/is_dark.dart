import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  bool get isDark {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
