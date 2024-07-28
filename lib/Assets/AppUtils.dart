import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

class AppUtils{  
  
  AppUtils._();
  static final AppUtils _instance = AppUtils._();
  factory AppUtils() => _instance;


  String calculate(String text){
  Parser p = Parser();
  ContextModel contextModel = ContextModel();
  text = text.substring(text.indexOf("₹")+1);                
  text = text.replaceAll("÷", "/");
  text = text.replaceAll('×', '*');   
  var exp = p.parse(text);
  var result = exp.evaluate(EvaluationType.REAL, contextModel).toString();  
  return result;  
}

String getCurrentDate(){
      var date = DateTime.now();
      return DateFormat('MMMM dd, yyyy hh:mm a').format(date);

    }

int getCurrentYear() {
  var date = DateTime.now();
  
  String yearString = DateFormat('yyyy').format(date);
  
  int year = int.parse(yearString);
  return year;
}

String removeCurrencySymbol(String value) {
  // Remove the currency symbol and trim extra spaces
  String result = value.replaceAll("₹", "").trim();
  return result;
}

String formatDateTime(DateTime dateTime, TimeOfDay timeOfDay) {
  
  DateTime combinedDateTime = DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );

  
  String formattedDateTime = DateFormat('MMM dd yyyy, hh:mm a').format(combinedDateTime);

  return formattedDateTime;
}
String getTimeMillisFromDateAndTime(DateTime dateTime, TimeOfDay timeOfDay){
  DateTime combinedDateTime = DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );
  return combinedDateTime.millisecondsSinceEpoch.toString();
  
}
}



