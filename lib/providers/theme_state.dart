import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  get themeMode {
    return _themeMode;
  }

  set themeMode(ThemeMode theme) {
    _themeMode = theme;
    notifyListeners();
  }

  void toggleThemeMode(Brightness current) {
    _themeMode = current == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  bool isLight(Brightness current) {
    return current == Brightness.light;
  }
}
