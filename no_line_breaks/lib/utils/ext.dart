import 'package:flutter/material.dart';

extension TextSizeExt on int {
  String toDisplay() {
    switch (this) {
      case 16:
        return 'Small';
      case 20:
        return 'Medium';
      case 24:
        return 'Large';
      default:
        return 'Error';
    }
  }
}

extension ThemeModeExt on ThemeMode {
  String toDisplay() {
    switch (this) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }
}
