import 'package:age/age.dart';
import 'package:birthday_calculator/model/the_age_model.dart';

import 'next_birthday_model.dart';

class Calculator {
  //كلاس حساب العمر

  var theAge = TheAge();
  //كلاس العمر
  var nextBirthDay = NextBirthDay();
  //كلاس يوم الميلاد
  TheAge calculator(DateTime birthday, DateTime today) {
    AgeDuration age;
    // Find out your age
    age = Age.dateDifference(
        fromDate: birthday, toDate: today, includeToDate: false);
    //مثود حساب العمر
    print('Your age is $age');
    theAge.ages = age.years;
    theAge.months = age.months;
    theAge.days = age.days;
    return theAge;
  }

  NextBirthDay calculatorNextBirthDay(DateTime birthday, DateTime today) {

    DateTime tempDate = DateTime(today.year, birthday.month, birthday.day);
    DateTime nextBirthdayDate = tempDate.isBefore(today)
        ? Age.add(date: tempDate, duration: AgeDuration(years: 1))
        : tempDate;
    AgeDuration nextBirthdayDuration = Age.dateDifference(fromDate: today, toDate: nextBirthdayDate);
    //مثود حساب يوم الميلاد

    print('You next birthday will be on $nextBirthdayDate or in $nextBirthdayDuration');

    nextBirthDay.ages = nextBirthdayDuration.years;
    nextBirthDay.months = nextBirthdayDuration.months;
    nextBirthDay.days = nextBirthdayDuration.days;

    return nextBirthDay;
  }
}
