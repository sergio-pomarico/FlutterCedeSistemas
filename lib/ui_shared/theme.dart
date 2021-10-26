import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:fluttergram/ui_shared/constanst.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: secondaryColor,
        fontSize: 18,
      ),
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: textColor),
    bodyText2: TextStyle(color: textColor),
  );
}
