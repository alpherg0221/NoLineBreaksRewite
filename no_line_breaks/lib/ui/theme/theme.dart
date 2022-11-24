import 'package:flutter/material.dart';

import 'color.dart';
import 'type.dart';

const ColorScheme lightColor = ColorScheme.light(
  primary: lightPrimary,
  onPrimary: lightOnPrimary,
  primaryContainer: lightPrimaryContainer,
  onPrimaryContainer: lightOnPrimaryContainer,
  secondary: lightSecondary,
  onSecondary: lightOnSecondary,
  secondaryContainer: lightSecondaryContainer,
  onSecondaryContainer: lightOnSecondaryContainer,
  tertiary: lightTertiary,
  onTertiary: lightOnTertiary,
  tertiaryContainer: lightTertiaryContainer,
  onTertiaryContainer: lightOnTertiaryContainer,
  error: lightError,
  onError: lightOnError,
  errorContainer: lightErrorContainer,
  onErrorContainer: lightOnErrorContainer,
  background: lightBackground,
  onBackground: lightOnBackground,
  surface: lightSurface,
  onSurface: lightOnSurface,
  surfaceVariant: lightSurfaceVariant,
  onSurfaceVariant: lightOnSurfaceVariant,
  outline: lightOutline,
  inverseSurface: lightInverseSurface,
  onInverseSurface: lightOnInverseSurface,
);

const ColorScheme darkColor = ColorScheme.dark(
  primary: darkPrimary,
  onPrimary: darkOnPrimary,
  primaryContainer: darkPrimaryContainer,
  onPrimaryContainer: darkOnPrimaryContainer,
  secondary: darkSecondary,
  onSecondary: darkOnSecondary,
  secondaryContainer: darkSecondaryContainer,
  onSecondaryContainer: darkOnSecondaryContainer,
  tertiary: darkTertiary,
  onTertiary: darkOnTertiary,
  tertiaryContainer: darkTertiaryContainer,
  onTertiaryContainer: darkOnTertiaryContainer,
  error: darkError,
  onError: darkOnError,
  errorContainer: darkErrorContainer,
  onErrorContainer: darkOnErrorContainer,
  background: darkBackground,
  onBackground: darkOnBackground,
  surface: darkSurface,
  onSurface: darkOnSurface,
  surfaceVariant: darkSurfaceVariant,
  onSurfaceVariant: darkOnSurfaceVariant,
  outline: darkOutline,
  inverseSurface: darkInverseSurface,
  onInverseSurface: darkOnInverseSurface,
);

ThemeData lightTheme = ThemeData.from(
  colorScheme: lightColor,
  textTheme: jetBrainsMonoTextTheme,
  useMaterial3: true,
);

ThemeData darkTheme = ThemeData.from(
  colorScheme: darkColor,
  textTheme: jetBrainsMonoTextTheme,
  useMaterial3: true,
);
