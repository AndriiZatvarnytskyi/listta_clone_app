import 'package:flutter/material.dart';
import 'package:listta_clone_app/config/constants.dart';

ThemeData lightTheme() {
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
        color: Color.fromARGB(255, 240, 240, 240),
      ),
      disabledColor: Colors.black87,
      hintColor: Colors.black26,
      primaryColor: kPrimaryColor,
      primaryColorDark: const Color.fromARGB(255, 206, 167, 62),
      primaryColorLight: const Color.fromRGBO(255, 206, 167, 62),
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 179, 179, 179)),
      fontFamily: 'Futura',
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
        displayLarge: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 36),
        displayMedium: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 20),
        displaySmall: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 17),
        headlineMedium: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.w400,
            fontSize: 16),
        headlineSmall: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.bold,
            fontSize: 14),
        titleLarge: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.w500,
            fontSize: 13),
        bodyLarge: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.normal,
            fontSize: 12),
        bodyMedium: TextStyle(
            color: Color(0xFF11071B),
            fontWeight: FontWeight.normal,
            fontSize: 10),
        titleMedium: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 15),
      ));
}

ThemeData peachTheme() {
  return ThemeData(
      iconTheme: IconThemeData(
        color: Color.fromARGB(186, 255, 255, 255),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          foregroundColor: kPeachThemeTextColor,
          elevation: 3),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(214, 255, 167, 109)))),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black87,
        elevation: 0,
        color: Color.fromARGB(255, 221, 160, 140),
      ),
      disabledColor: Colors.black87,
      hintColor: Color.fromARGB(160, 221, 160, 140),
      primaryColor: Color.fromARGB(255, 202, 107, 75),
      scaffoldBackgroundColor: Color.fromARGB(255, 250, 231, 225),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 179, 179, 179)),
      fontFamily: 'Futura',
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
        displayLarge: TextStyle(
            color: kPeachThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 36),
        displayMedium: TextStyle(
            color: kPeachThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        displaySmall: TextStyle(
            color: kPeachThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 17),
        headlineMedium: TextStyle(
            color: kPeachThemeTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        headlineSmall: TextStyle(
            color: kPeachThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        titleLarge: TextStyle(
            color: kPeachThemeTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 13),
        bodyLarge: TextStyle(
            color: kPeachThemeTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 12),
        bodyMedium: TextStyle(
            color: kPeachThemeTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 10),
        titleMedium: TextStyle(
            color: kPeachThemeTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ));
}

ThemeData blueTheme() {
  return ThemeData(
      iconTheme: IconThemeData(
        color: Color.fromARGB(186, 255, 255, 255),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          foregroundColor: kBlueThemeTextColor,
          elevation: 3),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(214, 255, 167, 109)))),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black87,
        elevation: 0,
        color: Color.fromARGB(255, 140, 182, 221),
      ),
      disabledColor: Colors.black87,
      hintColor: Color.fromARGB(159, 140, 178, 221),
      primaryColor: Color.fromARGB(255, 69, 126, 179),
      scaffoldBackgroundColor: Color.fromARGB(255, 255, 247, 240),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 179, 179, 179)),
      fontFamily: 'Futura',
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
        displayLarge: TextStyle(
            color: kBlueThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 36),
        displayMedium: TextStyle(
            color: kBlueThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        displaySmall: TextStyle(
            color: kBlueThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 17),
        headlineMedium: TextStyle(
            color: kBlueThemeTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        headlineSmall: TextStyle(
            color: kBlueThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        titleLarge: TextStyle(
            color: kBlueThemeTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 13),
        bodyLarge: TextStyle(
            color: kBlueThemeTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 12),
        bodyMedium: TextStyle(
            color: kBlueThemeTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 10),
        titleMedium: TextStyle(
            color: kBlueThemeTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ));
}

ThemeData seaTheme() {
  return ThemeData(
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 240, 239, 239),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          foregroundColor: kSeaThemeTextColor,
          elevation: 3),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(214, 255, 167, 109)))),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black87,
        elevation: 0,
        color: Color.fromARGB(255, 175, 224, 212),
      ),
      disabledColor: Colors.black87,
      hintColor: Color.fromARGB(193, 181, 196, 201),
      primaryColor: Color.fromARGB(255, 164, 126, 196),
      scaffoldBackgroundColor: Color.fromARGB(255, 236, 230, 247),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 179, 179, 179)),
      fontFamily: 'Futura',
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
        displayLarge: TextStyle(
            color: kSeaThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 36),
        displayMedium: TextStyle(
            color: kSeaThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        displaySmall: TextStyle(
            color: kSeaThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 17),
        headlineMedium: TextStyle(
            color: kSeaThemeTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        headlineSmall: TextStyle(
            color: kSeaThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        titleLarge: TextStyle(
            color: kSeaThemeTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 13),
        bodyLarge: TextStyle(
            color: kSeaThemeTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 12),
        bodyMedium: TextStyle(
            color: kSeaThemeTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 10),
        titleMedium: TextStyle(
            color: kSeaThemeTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ));
}

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kContentColorLightTheme,
      hintColor: Colors.white38,
      appBarTheme: const AppBarTheme(
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        color: kAppBarColor,
      ),
      iconTheme: const IconThemeData(color: kContentColorDarkTheme),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: kErrorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: kContentColorLightTheme,
        selectedItemColor: Colors.white70,
        unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: kPrimaryColor),
        showUnselectedLabels: true,
      ),
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          color: Colors.white30,
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
        displayLarge: TextStyle(
            color: kContentColorDarkTheme,
            fontWeight: FontWeight.bold,
            fontSize: 36),
        displayMedium: TextStyle(
            color: kContentColorDarkTheme,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        displaySmall: TextStyle(
            color: kContentColorDarkTheme,
            fontWeight: FontWeight.bold,
            fontSize: 17),
        headlineMedium: TextStyle(
            color: kContentColorDarkTheme,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        headlineSmall: TextStyle(
            color: kContentColorDarkTheme,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        titleLarge: TextStyle(
            color: kContentColorDarkTheme,
            fontWeight: FontWeight.w500,
            fontSize: 13),
        bodyLarge: TextStyle(
            color: kContentColorDarkTheme,
            fontWeight: FontWeight.normal,
            fontSize: 12),
        bodyMedium: TextStyle(
            color: kContentColorDarkTheme,
            fontWeight: FontWeight.normal,
            fontSize: 10),
        titleMedium: TextStyle(
            color: kContentColorDarkTheme,
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ));
}
