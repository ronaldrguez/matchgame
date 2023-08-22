import 'package:flutter/material.dart';

var PRIMARY_COLOR = Colors.purple;
var PRIMARY_DARK_COLOR = Colors.deepPurple.shade700;
var FOCUS_COLOR = Colors.indigo;
var ACCENT_COLOR = Colors.deepPurpleAccent.shade200;
var ERROR_COLOR = Colors.red.shade700;

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: PRIMARY_COLOR.shade200,
  focusColor: FOCUS_COLOR,
  appBarTheme: AppBarTheme(
    backgroundColor: ACCENT_COLOR
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
        backgroundColor: MaterialStateProperty.all<Color>(ACCENT_COLOR)),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: ACCENT_COLOR)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
        ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ACCENT_COLOR,
  ),
);

ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
