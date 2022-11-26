import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/ui/components/dialog.dart';
import 'package:no_line_breaks/ui/components/nav_rail.dart';
import 'package:no_line_breaks/ui/settings/settings_viewmodel.dart';
import 'package:no_line_breaks/ui/theme/theme.dart';
import 'package:no_line_breaks/utils/ext.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingsStateProvider.notifier);
    final state = ref.watch(settingsStateProvider);

    return Scaffold(
      body: Row(
        children: [
          const NavRail(),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: SettingsList(
              lightTheme: lightSettingsTheme,
              darkTheme: darkSettingsTheme,
              sections: [
                SettingsSection(
                  title: const Text('表示'),
                  tiles: <SettingsTile>[
                    SettingsTile(
                      title: const Text('テキストサイズ'),
                      leading: const Icon(Icons.format_size_rounded),
                      value: Text(state.textSize.toDisplay()),
                      onPressed: (_) async => Get.dialog(
                        const SelectTextSizeDialog(),
                      ),
                    ),
                    SettingsTile.switchTile(
                      title: const Text('1文ごとに改行する'),
                      leading: const Icon(Icons.format_line_spacing_rounded),
                      initialValue: state.isBreakLine,
                      onToggle: (value) async {
                        return viewModel.changeIsBreakLine(value);
                      },
                    ),
                  ],
                ),
                SettingsSection(
                  title: const Text('一般'),
                  tiles: <SettingsTile>[
                    SettingsTile(
                      title: const Text('テーマ'),
                      leading: const Icon(Icons.brightness_4_rounded),
                      value: Text(state.themeMode.toDisplay()),
                      onPressed: (context) async => Get.dialog(
                        const SelectThemeDialog(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
