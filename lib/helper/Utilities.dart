import 'package:flutter/material.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/models/MDUser.dart';
import 'package:toast/toast.dart';

class Utilities{

  static String language = 'en';
  static String currency = 'sar';
  static bool isGuest = false;
  static String google_map_api_key="AIzaSyChT7iBjqvTKOK4VdtaOa9nZiSqNk38z_I";
  static var isDarkTheme;
  static MDUser? user;


  static void showToast(String text,BuildContext context){
    Toast.show(text, textStyle: context, duration: 4,webTexColor: Colors.white,backgroundColor: CustomColor.blackColor.withOpacity(0.2));
  }

  static String makeFirstLetterOfWordCapital(String text){
    List<String> splittedString = text.split(' ');
    String resultString = '';
    for(int i = 0 ; i < splittedString.length ; i++){
      splittedString[i] = splittedString[i][0].toUpperCase() + splittedString[i].substring(1);
      resultString += splittedString[i];
      if(i != splittedString.length - 1){
        resultString += ' ';
      }
    }
    return resultString;
  }

  static bool validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }



}