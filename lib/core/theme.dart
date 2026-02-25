import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.white,
    scaffoldBackgroundColor: Colors.white,
  ); 
}