import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/ui/app.dart';

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  runApp(const ProviderScope(child: NoLineBreaksApp()));
}