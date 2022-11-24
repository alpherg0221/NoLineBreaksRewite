import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/route/app_route.gr.dart';
import 'package:no_line_breaks/route/route_path.dart';
import 'package:no_line_breaks/ui/home/home_screen.dart';
import 'package:no_line_breaks/ui/settings/settings_screen.dart';

final appRouterProvider =
    ChangeNotifierProvider<AppRouter>((ref) => AppRouter());

@CustomAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: RoutePath.appRouteHome,
      page: HomeScreen,
      initial: true,
    ),
    AutoRoute(
      path: RoutePath.appRouteSettings,
      page: SettingsScreen,
    )
  ],
  transitionsBuilder: TransitionsBuilders.noTransition,
)
class $AppRouter {}
