import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  // كلاس الثيم 
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;
  // مثود جلب الثيم

  setTheme(ThemeData themeData){
    // مثود وضع الثيم 
    _themeData = themeData;
    notifyListeners();
  }

}