import 'package:birthday_calculator/screens/user.dart';
import 'package:flutter/material.dart';

class AppbarBirthdayApp {
  TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 18,);
  AppBar appbar(context) {
    //String subject = 'حساب العمر';
    return AppBar(
      elevation: 0,
      //ظل 
      actions: [
        IconButton(
          icon: Icon(Icons.login),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => User(),
                ));
          },
        )
      ],
      bottom: TabBar(
        tabs: [
          Text(
            'الرئيسية',
            style: textStyle,
          ),
          Text(
            'الإعدادات',
            style: textStyle,
          ),
        ],
      ),
      title: Container(
        child: Image.asset('images/background.png'),
        
        height: 100,
        width: 100,
      ),
      centerTitle: true,
    );
  }
}
