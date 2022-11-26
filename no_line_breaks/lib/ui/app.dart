import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/route/route_path.dart';
import 'package:no_line_breaks/ui/home/home_screen.dart';
import 'package:no_line_breaks/ui/info/info_screen.dart';
import 'package:no_line_breaks/ui/settings/settings_screen.dart';
import 'package:no_line_breaks/ui/settings/settings_viewmodel.dart';
import 'package:no_line_breaks/ui/theme/theme.dart';

class NoLineBreaksApp extends HookConsumerWidget {
  const NoLineBreaksApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsStateProvider);

    return GetMaterialApp(
      title: 'NoLineBreaks',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: state.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePath.home.path,
      getPages: [
        GetPage(
          name: RoutePath.home.path,
          page: () => const HomeScreen(),
          title: 'Home',
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RoutePath.settings.path,
          page: () => const SettingsScreen(),
          title: 'Settings',
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RoutePath.info.path,
          page: () => const InfoScreen(),
          title: 'Info',
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
