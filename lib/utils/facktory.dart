import 'package:flutter/material.dart';

class FuckTory {
  static ThemeData liteTheme() {
    return ThemeData(primarySwatch: Colors.cyan);
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.grey,
      accentColor: Colors.grey,
    );
  }
}
