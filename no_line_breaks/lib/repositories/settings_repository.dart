import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  final textSizeKey = 'textSizeKey';
  final isBreakLineKey = 'isBreakLineKey';
  final themeModeKey = 'themeMode';

  Future<void> setTextSize(int textSize) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(textSizeKey, textSize);
  }

  Future<int> getTextSize() async {
    final prefs = await SharedPreferences.getInstance();
    final textSize = prefs.getInt(textSizeKey);
    return textSize ?? 16;
  }

  Future<void> setIsBreakLine(bool isBreakLine) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isBreakLineKey, isBreakLine);
  }

  Future<bool> getIsBreakLine() async {
    final prefs = await SharedPreferences.getInstance();
    final isBreakLine = prefs.getBool(isBreakLineKey);
    return isBreakLine ?? true;
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(themeModeKey, themeMode.name);
  }

  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeString = prefs.getString(themeModeKey);

    if (themeModeString == ThemeMode.system.name) {
      return ThemeMode.system;
    } else if (themeModeString == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (themeModeString == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }
}
