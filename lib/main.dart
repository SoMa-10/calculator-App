import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:birthday_calculator/model/theme_model.dart';
import 'package:birthday_calculator/screens/user.dart';
import 'package:birthday_calculator/utils/facktory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (th) => ThemeChanger(FuckTory.liteTheme()),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        home: AnimatedSplashScreen(
          splashIconSize: 300,
          duration: 500,
          splashTransition: SplashTransition.sizeTransition,
          animationDuration: Duration(milliseconds: 1500),
          backgroundColor: Colors.white,
          splash: Image.asset('images/background.png'),
          nextScreen: Directionality(
            child: User(),
            textDirection: TextDirection.rtl,
          ),
        ));
  }
}
