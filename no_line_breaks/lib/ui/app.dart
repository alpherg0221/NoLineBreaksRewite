import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/ui/components/nav_rail.dart';
import 'package:no_line_breaks/ui/navigation.dart';
import 'package:no_line_breaks/ui/settings/settings_viewmodel.dart';
import 'package:no_line_breaks/ui/theme/theme.dart';

class NoLineBreaksApp extends HookConsumerWidget {
  const NoLineBreaksApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsStateProvider);

    return MaterialApp(
      title: 'NoLineBreaks',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: state.themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: const <Widget>[
            NavRail(),
            VerticalDivider(thickness: 1, width: 1),
            Expanded(child: Center(child: Navigation())),
          ],
        ),
      ),
    );
  }
}
