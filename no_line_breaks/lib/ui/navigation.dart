import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/route/app_route.dart';
import 'package:no_line_breaks/ui/settings/settings_viewmodel.dart';
import 'package:no_line_breaks/ui/theme/theme.dart';

class Navigation extends HookConsumerWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final state = ref.watch(settingsStateProvider);

    return MaterialApp.router(
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: state.themeMode,
      debugShowCheckedModeBanner: false,
    );
  }
}
