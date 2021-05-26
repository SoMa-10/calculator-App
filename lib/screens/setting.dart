
import 'package:birthday_calculator/main.dart';
import 'package:birthday_calculator/model/appbar.dart';
import 'package:birthday_calculator/model/theme_model.dart';
import 'package:birthday_calculator/model/url.dart';
import 'package:birthday_calculator/screens/home.dart';
import 'package:birthday_calculator/screens/user.dart';
import 'package:birthday_calculator/utils/facktory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  @override
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting> {
  TextStyle textStyle = TextStyle(fontSize: 18,fontWeight: FontWeight.bold);
  UrlLauncher url = UrlLauncher();
  var appbar = AppbarBirthdayApp();
  var myapp = MyAppState();
  bool th = false;
  var userName = UserState.textEditingController.text;
  var old = HomeState.theAge.ages;
  ThemeChanger _theme;

  @override
   Widget build(BuildContext context) {
    ThemeChanger theme = Provider.of<ThemeChanger>(context);
     _theme = theme;
    var userAcc = buildUserAccounts();
    var listTile = buildListSetting('اللغة', Icon(Icons.language), () {});
    var listTile1 = buildListSetting1('الوضع الليلي', Icon(Icons.color_lens));
    var line = buildLine();
    var listTi = buildAbout();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              userAcc,
              //listTile,
              //line,
              listTile1,
              line,
              listTi,
              buildRow(),
            ],
          ),

        ),
      ),
    );
  }

  Widget buildListSetting(String text, Icon icon, Function fun) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            text,
            style: textStyle,
          ),
          leading: icon,
          onTap: fun,
        )

      ],
    );
  }

  Widget buildListSetting1(String text, Icon icon,) {

    if(_theme.getTheme() == FuckTory.darkTheme()){th = true;}
    setState(() {});
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            text,
            style: textStyle,
          ),
          leading: icon,
          trailing: Switch(
            activeColor: Colors.grey,
            value: th,
            onChanged: (_) {
              if(th==true) _theme.setTheme(FuckTory.liteTheme()); 
              if(th==false)_theme.setTheme(FuckTory.darkTheme());

              th=!th;
              setState(() {

              });
            },
          ),
        )

      ],
    );
  }

  Widget buildLine() {
    return Divider(
      indent: 50,
      color: Colors.grey,
    );
  }

  Widget buildUserAccounts() {
    return Container(
      height: 180,
      
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            bottomRight: 
            Radius.circular(20),bottomLeft: 
            Radius.circular(20)
            )
            ),
        child: Column(
        children: [CircleAvatar(
          minRadius: 37,
          child: Icon(
            Icons.person),
        ),
          Text('الإسم:${userName}',style: textStyle,),
          Text('العمر:${old}',style: textStyle,)
        ],
      ),
      ),
      
    );
  }

  Widget buildIconCall() {
    return IconButton(
      icon: Icon(Icons.call),
      onPressed: () {
        url.launchURL('tel: 0577122910');
      },
    );
  }

  Widget buildIconSms() {
    return IconButton(
      icon: Icon(Icons.sms),
      onPressed: () {
        url.launchURL('sms: 0577122910');
      },
    );
  }

  Widget buildIconEmail() {
    return IconButton(
      icon: Icon(Icons.email),
      onPressed: () {
        url.launchURL('mailto: 0577122910');
      },
    );
  }

  Widget buildRow() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIconCall(),
          buildIconSms(),
          buildIconEmail()
        ],
      ),
    );
  }

  Widget buildAbout(){
    return Container(height: 120,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ExpansionTile(
        leading: Icon(Icons.info_outline),
        title: Text('حول',style: textStyle,),
        children: [Container(
          child: Text('حساب العمر',style: textStyle,),
        ),Container(
          child: Text('بسم الله الرحمان الرحيم',style: textStyle,),
        )],
      ),
    );

  }

  

}
