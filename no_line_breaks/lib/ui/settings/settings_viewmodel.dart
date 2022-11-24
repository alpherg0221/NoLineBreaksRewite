import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/repositories/settings_repository.dart';

final settingsStateProvider =
    StateNotifierProvider<SettingsViewModel, SettingsState>(
        (ref) => SettingsViewModel());

@immutable
class SettingsState {
  const SettingsState({
    required this.textSize,
    required this.isBreakLine,
    required this.themeMode,
  });

  final int textSize;
  final bool isBreakLine;
  final ThemeMode themeMode;

  SettingsState copy({int? textSize, bool? isBreakLine, ThemeMode? themeMode}) {
    return SettingsState(
      textSize: textSize ?? this.textSize,
      isBreakLine: isBreakLine ?? this.isBreakLine,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

class SettingsViewModel extends StateNotifier<SettingsState> {
  SettingsViewModel()
      : super(const SettingsState(
          textSize: 16,
          isBreakLine: true,
          themeMode: ThemeMode.system,
        )) {
    init();
  }

  final repository = SettingsRepository();

  void init() async {
    state = state.copy(
      textSize: await repository.getTextSize(),
      isBreakLine: await repository.getIsBreakLine(),
      themeMode: await repository.getThemeMode(),
    );
  }

  Future<void> changeTextSize(int newTextSize) async {
    await repository.setTextSize(newTextSize);
    state = state.copy(textSize: await repository.getTextSize());
  }

  Future<void> changeIsBreakLine(bool newIsBreakLine) async {
    await repository.setIsBreakLine(newIsBreakLine);
    state = state.copy(isBreakLine: await repository.getIsBreakLine());
  }

  Future<void> changeThemeMode(ThemeMode newThemeMode) async {
    await repository.setThemeMode(newThemeMode);
    state = state.copy(themeMode: await repository.getThemeMode());
  }
}
