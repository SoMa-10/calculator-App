import 'package:birthday_calculator/model/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:birthday_calculator/model/the_age_model.dart';
import 'package:birthday_calculator/model/next_birthday_model.dart';
import 'package:birthday_calculator/model/calcutor_model.dart';
import 'package:birthday_calculator/utils/format.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DateTime birthDayValue;
  var empty = DateTime.now();
  DateTime toDayValue = DateTime.now();
  DateTime timeNow = DateTime.now();
  var calculator = Calculator();
  //كلاس حساب العمر
  DateTime value;
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 =
      TextEditingController(text: '${ReformatDate.reForMat(DateTime.now())}');
  static var theAge = TheAge();
  //كلاس العمر
  var nextBirthDay = NextBirthDay();
  //كلاس يوم الميلاد
  var appbar = AppbarBirthdayApp();
  var widthSize = 100.0;
  //عرض
  var heightSize = 50.0;
  //طول
  var fontSize = 20.0;
  //حجم
  @override
  Widget build(BuildContext context) {
    Widget space = _buildSpace();
    Widget birthOfDay = _buildSubTitle('تاريخ الميلاد');
    Widget todayDate = _buildSubTitle('تاريخ اليوم');
    Widget textField1 = _buildTextField1();
    Widget textField2 = _buildTextField2();
    Widget rowButtons = _buildRowButtons();
    Widget rowContainerData1 = _buildRowContainerData1();
    Widget rowContainerData2 = _buildRowContainerData2();
    Widget ageIs = _buildSubTitle('عمرك الحالي');
    Widget textBirthDay = _buildSubTitle('تبقى على يوم ميلادك القادم');

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              space,
              birthOfDay,
              textField1,
              todayDate,
              textField2,
              space,
              rowButtons,
              ageIs,
              rowContainerData1,
              textBirthDay,
              rowContainerData2,
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }

  Widget _buildSubTitle(String text) {
    return Text(text,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
    //مثود نص
  }

  Widget _buildSpace() {
    return SizedBox(
      height: 25,
    );
    //مثود فراغ
  }

  Widget _buildTextField1() {
    return TextField(
      controller: textEditingController1,
      //قيمة المدخل
      decoration: _buildDecoration(),
      //شكل مكان الادخال
      textDirection: TextDirection.rtl,
      //الادخال يبدا من اليمين
      readOnly: true,
      //منع إدخال نص لانهو تاريخ
      onTap: () {
        showDatePicker(
                //مثود التاريخ
                context: context,
                initialDate: empty,
                //
                firstDate: DateTime(1900),
                //بداية التاريخ
                lastDate: empty)
            //نهاية التاريخ
            .then((value) {
          birthDayValue = value;
          setState(() {
            //اهم ادة في كلاس ستيت فول
            textEditingController1.text = ReformatDate.reForMat(value);
            //المدخل يساوي مثود
          });
          print(value);
        });
      },
    );
  }

  Widget _buildTextField2() {
    return TextField(
      controller: textEditingController2,
      //قيمة المدخل
      decoration: _buildDecoration(),
      //شكل مكان الادخال
      textDirection: TextDirection.rtl,
      //الادخال يبدا من اليمين
      readOnly: true,
      //منع إدخال نص لانهو تاريخ

      onTap: () {
        showDatePicker(
                //مثود التاريخ
                context: context,
                initialDate: empty,
                //
                firstDate: DateTime(1900),
                //بداية التاريخ
                lastDate: empty)
            //نهاية التاريخ
            .then((value) {
          toDayValue = value;
          setState(() {
            //اهم ادة في كلاس ستيت فول
            textEditingController2.text = ReformatDate.reForMat(value);
            //المدخل يساوي مثود
          });
          print(value);
        });
      },
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      prefixIcon: Icon(Icons.date_range),
    );
    //مثود مكان الادخال
  }

  Row _buildRowButtons() {
    var color = MaterialStateProperty.all(Theme.of(context).accentColor);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: widthSize,
          height: heightSize,
          child: ElevatedButton(
              style: ButtonStyle(backgroundColor: color),
              onPressed: () {
                //تشغيل الزر
                setState(() {
                  //اهم ادة في كلاس ستيت فول

                  TheAge theAgeClean = TheAge();
                  NextBirthDay nextBirthdayClean = NextBirthDay();
                  theAge = theAgeClean;
                  nextBirthDay = nextBirthdayClean;

                  textEditingController1.text = "";

                  birthDayValue = empty;

                  //متغيرات من كلاس يوم الميلاد
                });
              },
              child: Text(
                'أمسح',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
              )),
        ),
        Container(
          width: widthSize,
          height: heightSize,
          child: ElevatedButton(
              style: ButtonStyle(backgroundColor: color),
              onPressed: () {
                //تشغيل الزر
                setState(() {
                  //اهم ادة في كلاس ستيت فول

                  theAge = calculator.calculator(birthDayValue, toDayValue);
                  //كلاس العمر يساوي كلاس حساب العمر
                  nextBirthDay = calculator.calculatorNextBirthDay(
                      birthDayValue, toDayValue);
                  //كلاس يوم الميلاد يساوي كلاس حساب العمر
                });
              },
              child: Center(
                child: Text(
                  'إحسب',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                ),
              )),
        )
      ],
    );
  }

  Widget _buildContainerData(String text1, String text2) {
    return Container(
      child: Column(
        children: [
          Container(
            width: widthSize,
            height: heightSize,
            child: Card(
              color: Theme.of(context).accentColor,
              //الون الافتراضي
              child: Center(
                  child: Text(
                text1,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
          Container(
            width: widthSize,
            height: heightSize,
            child: Card(
                child: Center(
                    child: Text(
              text2,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ))),
          )
        ],
      ),
    );
  }

  Widget _buildRowContainerData1() {
    //
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _buildContainerData('العمر', theAge.ages.toString()),
      _buildContainerData('الشهر', theAge.months.toString()),
      _buildContainerData('اليوم', theAge.days.toString())
    ]);
  }

  Widget _buildRowContainerData2() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _buildContainerData(nextBirthDay.months.toString(), 'عدد الأشهر'),
      _buildContainerData(nextBirthDay.days.toString(), 'عدد الأيام')
    ]);
  }

  static String dateNaw() {
    String date = DateTime.now().year.toString() +
        '/' +
        DateTime.now().month.toString() +
        '/' +
        DateTime.now().day.toString();
    return date;
  }
}
