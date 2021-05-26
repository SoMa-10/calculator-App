import 'dart:io';
import 'package:birthday_calculator/model/appbar.dart';
import 'package:birthday_calculator/screens/setting.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class HomeTabs extends StatelessWidget {
  bool pop = true;
  var appbar = AppbarBirthdayApp();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('هل انت متأكد'),
          title: Text('هل تريد الخروج من التطبيق'),
          actions: [
            ElevatedButton(onPressed: () => exit(0), child: Text('خروج')),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('إلغاء'))
          ],
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appbar.appbar(context),
          body: TabBarView(
            children: [Home(), Setting()],
          ),
        ),
      ),
    );
  }
}
