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
    colorSchemeSeed: const Color.fromARGB(255, 232, 233, 233),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  ); 
}