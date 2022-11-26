import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/route/route_path.dart';

class NavRail extends HookConsumerWidget {
  const NavRail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationRail(
      selectedIndex:
          RoutePath.values.indexWhere((e) => e.path == Get.currentRoute),
      labelType: NavigationRailLabelType.all,
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
        NavigationRailDestination(
          icon: Icon(Icons.info_outline_rounded),
          selectedIcon: Icon(Icons.info_rounded),
          label: Text('Info'),
        ),
      ],
      onDestinationSelected: (int index) {
        Get.toNamed(RoutePath.values[index].path);
      },
    );
  }
}
