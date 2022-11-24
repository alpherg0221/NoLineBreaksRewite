import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/route/app_route.dart';
import 'package:no_line_breaks/route/route_path.dart';

class NavRail extends HookConsumerWidget {
  const NavRail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    final isActive = appRouter.current.isActive;
    final path = appRouter.current.path;

    return NavigationRail(
      selectedIndex: isActive ? RoutePath.getIndex(path) : 0,
      labelType: NavigationRailLabelType.selected,
      useIndicator: true,
      groupAlignment: 0.0,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings_rounded),
          label: Text('Settings'),
        ),
      ],
      onDestinationSelected: (int index) {
        appRouter.pushNamed(RoutePath.getPath(index));
      },
    );
  }
}
