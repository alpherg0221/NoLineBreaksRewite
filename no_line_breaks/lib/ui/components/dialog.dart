import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/ui/settings/settings_viewmodel.dart';

class SelectThemeDialog extends HookConsumerWidget {
  const SelectThemeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingsStateProvider.notifier);
    final state = ref.watch(settingsStateProvider);

    return SimpleDialog(
      title: const Text('Theme'),
      children: [
        RadioListTile(
          title: const Text('System'),
          value: ThemeMode.system,
          groupValue: state.themeMode,
          onChanged: (_) {
            viewModel.changeThemeMode(ThemeMode.system);
            Navigator.pop(context);
          },
        ),
        RadioListTile(
          title: const Text('Light'),
          value: ThemeMode.light,
          groupValue: state.themeMode,
          onChanged: (_) {
            viewModel.changeThemeMode(ThemeMode.light);
            Navigator.pop(context);
          },
        ),
        RadioListTile(
          title: const Text('Dark'),
          value: ThemeMode.dark,
          groupValue: state.themeMode,
          onChanged: (_) {
            viewModel.changeThemeMode(ThemeMode.dark);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class SelectTextSizeDialog extends HookConsumerWidget {
  const SelectTextSizeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingsStateProvider.notifier);
    final state = ref.watch(settingsStateProvider);

    return SimpleDialog(
      title: const Text('Text Size'),
      children: [
        RadioListTile(
          title: const Text('Small'),
          value: 16,
          groupValue: state.textSize,
          onChanged: (_) {
            viewModel.changeTextSize(16);
            Navigator.pop(context);
          },
        ),
        RadioListTile(
          title: const Text('Medium'),
          value: 20,
          groupValue: state.textSize,
          onChanged: (_) {
            viewModel.changeTextSize(20);
            Navigator.pop(context);
          },
        ),
        RadioListTile(
          title: const Text('Large'),
          value: 24,
          groupValue: state.textSize,
          onChanged: (_) {
            viewModel.changeTextSize(24);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}