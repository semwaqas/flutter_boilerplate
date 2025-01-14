import 'package:flutter/material.dart';
import 'theme.dart';

abstract class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodySmall: TextStyle(
      color: colorScheme.onPrimary.withOpacity(1),
      fontSize: 12,
      fontFamily: ThemeOptions.font,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: colorScheme.onPrimaryContainer.withOpacity(1),
      fontSize: 24,
      fontFamily: ThemeOptions.font,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(
      color: colorScheme.onPrimary.withOpacity(1),
      fontSize: 12,
      fontFamily: ThemeOptions.font,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      color: colorScheme.onPrimary.withOpacity(1),
      fontSize: 10,
      fontFamily: ThemeOptions.font,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: colorScheme.primary.withOpacity(1),
      fontSize: 20,
      fontFamily: ThemeOptions.font,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: colorScheme.onPrimary.withOpacity(1),
      fontSize: 16,
      fontFamily: ThemeOptions.font,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: colorScheme.onPrimary.withOpacity(1),
      fontSize: 14,
      fontFamily: ThemeOptions.font,
      fontWeight: FontWeight.w700,
    ),
  );
}