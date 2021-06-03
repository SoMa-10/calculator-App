import 'package:flutter/material.dart';

class FuckTory {
  // كلاس تغيير الوان الثيم
  static ThemeData liteTheme() {
    // مثود الوضع الافتراضي
    return ThemeData(primarySwatch: Colors.cyan);
  }

  static ThemeData darkTheme() {
    // مثود الوضع الليلي
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.grey,
      accentColor: Colors.grey,
    );
  }
}
