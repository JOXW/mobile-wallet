import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { light, dark }

class ThemeNotifier extends ChangeNotifier {
  static final String PREFS_THEME_KEY = "THEME";

  ThemeType get currentTheme => _currentTheme;
  ThemeData get currentThemeData => _currentThemeData;

  ThemeType _currentTheme = ThemeType.light;
  ThemeData _currentThemeData = themeData[0];

  ThemeNotifier() {
    initThemeData();
  }

  initThemeData() async {
    _currentTheme = await loadSelectedTheme();
    _currentThemeData =
        currentTheme == ThemeType.light ? themeData[0] : themeData[1];
    notifyListeners();
  }

  void switchTheme() => currentTheme == ThemeType.light
      ? currentTheme = ThemeType.dark
      : currentTheme = ThemeType.light;

  set currentTheme(ThemeType theme) {
    if (theme != null) {
      _currentTheme = theme;
      _currentThemeData =
          currentTheme == ThemeType.light ? themeData[0] : themeData[1];
      saveSelectedTheme(theme);
      notifyListeners();
    }
  }

  Future saveSelectedTheme(ThemeType themeType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(PREFS_THEME_KEY, themeType.index);
  }

  Future<ThemeType> loadSelectedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt(PREFS_THEME_KEY) ?? 0;
    return ThemeType.values[index];
  }

  static final List<ThemeData> themeData = [
    ThemeData(
      primarySwatch: Colors.blue,
      bottomAppBarColor: Colors.white,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      buttonColor: Colors.white,
      textTheme: TextTheme(
        headline: TextStyle(color: Colors.black),
        title: TextStyle(color: Colors.black),
        body1: TextStyle(color: Colors.black),
      ),
    ),
    ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      backgroundColor: Color(0xFF121212),
      bottomAppBarColor: Colors.black87,
      buttonColor: Colors.black54,
      textTheme: TextTheme(
        headline: TextStyle(color: Colors.white),
        title: TextStyle(color: Colors.white, fontSize: 18.0),
        body1: TextStyle(color: Colors.white),
      ),
    ),
  ];
}
