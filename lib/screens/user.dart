import 'package:flutter/material.dart';
import 'home_tabs.dart';

class User extends StatefulWidget {
  @override
  UserState createState() => UserState();
}

class UserState extends State<User> {
  //واجهة التطبيق
  static var textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [title(), textField(), enterButton()],
        mainAxisAlignment: MainAxisAlignment.center,
      )),
    );
  }

  Widget title() {
    //مثود العنوان
    return Text(
      'اهلا وسهلا بك',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  Widget textField() {
    //مثود المدخل
    return Padding(
      padding: EdgeInsets.only(
        right: 25,
        bottom: 25,
        left: 25,
      ),
      //تصغير من نواحي معينة
      child: TextField(
        decoration: inputDecoration(),
        keyboardType: TextInputType.name,
        //نوع الكيبود
        controller: textEditingController,
        //قيمة المدخل
      ),
    );
  }

  InputDecoration inputDecoration() {
    //مثود شكل المدخل
    return InputDecoration(
        border: OutlineInputBorder(
          //خط الادخال
          borderRadius: BorderRadius.circular(30),
          //شكل خط الادخال
        ),
        enabledBorder: OutlineInputBorder(
          //خط الادخال قبل النقر
          borderRadius: BorderRadius.circular(30),
          //شكل خط الادخال قبل النقر
        ),
        hintText: 'ادخل اسمك',
        //نص ارشادي في المدخل
        prefixIcon: Icon(Icons.person),
        hintStyle:
            //ايقونة في بداية المدخل
            TextStyle(fontWeight: FontWeight.bold));
  }

  Widget enterButton() {
    //مثود زر
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
        child: Text('التالي',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            //ظل الزر
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).primaryColor)),
        //لون افتراضي
        onPressed: () {
          if (textEditingController.text != '') {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeTabs(),
                  //الانتقال الى صفحة جديدة
                ));
          }
        },
      ),
    );
  }
}
