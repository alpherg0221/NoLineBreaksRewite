import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_line_breaks/ui/app.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: NoLineBreaksApp()));
}