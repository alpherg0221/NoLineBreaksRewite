import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/ui/components/nav_rail.dart';
import 'package:no_line_breaks/ui/theme/theme.dart';
import 'package:settings_ui/settings_ui.dart';

class InfoScreen extends HookConsumerWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: NavRailLayout(
        child: SettingsList(
          lightTheme: lightSettingsTheme,
          darkTheme: darkSettingsTheme,
          sections: [
            SettingsSection(
              title: const Text('開発者'),
              tiles: <SettingsTile>[
                SettingsTile(
                  title: const Text('Github'),
                  leading: const Icon(Icons.open_in_new_rounded),
                  onPressed: (_) async => html.window.open(
                    'https://github.com/alpherg0221/NoLineBreaksRewite',
                    '',
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('その他'),
              tiles: <SettingsTile>[
                SettingsTile(
                  title: const Text('License'),
                  leading: const Icon(Icons.description_rounded),
                  onPressed: (context) => showLicensePage(context: context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
