import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/ui/components/dialog.dart';
import 'package:no_line_breaks/ui/settings/settings_viewmodel.dart';
import 'package:no_line_breaks/utils/ext.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingsStateProvider.notifier);
    final state = ref.watch(settingsStateProvider);

    return Scaffold(
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('表示'),
            tiles: <SettingsTile>[
              SettingsTile(
                title: const Text('Text Size'),
                leading: const Icon(Icons.format_size_rounded),
                value: Text(state.textSize.toDisplay()),
                onPressed: (context) async => showDialog(
                  context: context,
                  builder: (_) => const SelectTextSizeDialog(),
                ),
              ),
              SettingsTile.switchTile(
                title: const Text('Break line after each sentence'),
                leading: const Icon(Icons.format_line_spacing_rounded),
                initialValue: state.isBreakLine,
                onToggle: (value) async => viewModel.changeIsBreakLine(value),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('一般'),
            tiles: <SettingsTile>[
              SettingsTile(
                title: const Text('Theme'),
                leading: const Icon(Icons.brightness_4_rounded),
                value: Text(state.themeMode.toDisplay()),
                onPressed: (context) async => showDialog(
                  context: context,
                  builder: (_) => const SelectThemeDialog(),
                ),
              ),
            ],
          ),
        ],

      ),
    );
  }
}
