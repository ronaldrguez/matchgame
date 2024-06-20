import 'package:flutter/material.dart';

var PRIMARY_COLOR = Colors.purple.shade200;
var PRIMARY_DARK_COLOR = Colors.deepPurple.shade700;
var FOCUS_COLOR = Colors.indigo;
var ACCENT_COLOR = Colors.deepPurpleAccent.shade200;
var ERROR_COLOR = Colors.red.shade700;

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: PRIMARY_DARK_COLOR,
    brightness: Brightness.light,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
      shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
      shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: PRIMARY_DARK_COLOR, brightness: Brightness.dark),
);
