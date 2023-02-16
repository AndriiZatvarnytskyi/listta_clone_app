import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 3),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 206, 167, 62)))),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black87,
        elevation: 0,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      disabledColor: Colors.black87,
      primaryColor: const Color.fromARGB(255, 168, 168, 168),
      primaryColorDark: const Color.fromARGB(255, 206, 167, 62),
      primaryColorLight: const Color.fromRGBO(255, 206, 167, 62),
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 179, 179, 179)),
      fontFamily: 'Futura',
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 36),
        headline2: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 20),
        headline3: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 17),
        headline4: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.w400,
            fontSize: 16),
        headline5: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 14),
        headline6: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.w500,
            fontSize: 13),
        bodyText1: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.normal,
            fontSize: 12),
        bodyText2: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.normal,
            fontSize: 10),
        subtitle1: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 15),
      ));
}
