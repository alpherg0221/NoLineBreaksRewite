class RoutePath {
  static const appRouteHome = '/home';
  static const appRouteSettings = '/settings';

  static int getIndex(String path) {
    switch (path) {
      case RoutePath.appRouteHome:
        return 0;
      case RoutePath.appRouteSettings:
        return 1;
      default:
        throw ArgumentError("RoutePath Path Error");
    }
  }

  static String getPath(int index) {
    switch (index) {
      case 0:
        return appRouteHome;
      case 1:
        return appRouteSettings;
      default:
        throw ArgumentError("RoutePath Index Error");
    }
  }
}