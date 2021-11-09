import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

import 'package:fluttergram/ui_shared/constanst.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontSize: 14,
      color: secondaryColor,
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: textColor),
    bodyText2: TextStyle(color: textColor),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    gapPadding: 10,
    borderSide: BorderSide(color: textColor, width: 2.0),
  );

  OutlineInputBorder outlineErrorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    gapPadding: 10,
    borderSide: BorderSide(color: Colors.red[200]!, width: 2.0),
  );

  OutlineInputBorder outlineDisableInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    gapPadding: 10,
    borderSide: BorderSide(color: Colors.grey[400]!, width: 2.0),
  );

  return InputDecorationTheme(
    floatingLabelBehavior: Platform.isIOS
        ? FloatingLabelBehavior.always
        : FloatingLabelBehavior.auto,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    errorBorder: outlineErrorInputBorder,
    disabledBorder: outlineDisableInputBorder,
    border: outlineInputBorder,
  );
}
