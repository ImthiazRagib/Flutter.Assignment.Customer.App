import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;
  Color get backgroundColor => _themeMode == ThemeMode.dark ? Colors.black : Colors.white;
  Color get textColor => _themeMode == ThemeMode.dark ? Colors.white : Colors.black;
  Color get accentColor => _themeMode == ThemeMode.dark ? Colors.white : Colors.black;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
