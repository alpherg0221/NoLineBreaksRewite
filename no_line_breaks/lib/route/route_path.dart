enum RoutePath {
  home('/'),
  settings('/settings'),
  info('/info');

  final String path;
  const RoutePath(this.path);
}