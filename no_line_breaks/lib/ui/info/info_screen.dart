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
                  title: const Text('開発者'),
                  tiles: <SettingsTile>[
                    SettingsTile(
                      title: const Text('Github'),
                      leading: const Icon(Icons.open_in_new_rounded),
                      onPressed: (_) => {
                        html.window.open(
                          'https://github.com/alpherg0221/NoLineBreaksRewite',
                          '',
                        )
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
