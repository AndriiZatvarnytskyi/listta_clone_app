import 'package:flutter/material.dart';
import 'package:listta_clone_app/config/constants.dart';

ThemeData lightTheme() {
  return ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 240, 240, 240),
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
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: Color.fromARGB(255, 240, 240, 240),
        hourMinuteShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        dayPeriodTextColor: kLightThemeTextColor,
        dayPeriodShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hourMinuteColor: kLightScaffoldBackgroundColor,
        hourMinuteTextColor: kLightThemeTextColor,
        dialHandColor: Colors.black26,
        dialBackgroundColor: kLightScaffoldBackgroundColor,
        hourMinuteTextStyle: TextStyle(
            color: kLightThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 25),
        dayPeriodTextStyle: TextStyle(
            color: kLightThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        helpTextStyle: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
        dialTextColor: kLightThemeTextColor,
        entryModeIconColor: kLightScaffoldBackgroundColor,
      ),
      disabledColor: Colors.black87,
      hintColor: Colors.black26,
      primaryColor: kPrimaryColor,
      primaryColorDark: const Color.fromARGB(255, 206, 167, 62),
      primaryColorLight: const Color.fromRGBO(255, 206, 167, 62),
      scaffoldBackgroundColor: kLightScaffoldBackgroundColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 179, 179, 179)),
      fontFamily: 'Futura',
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          color: kLightThemeTextColor,
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
        displayLarge: TextStyle(
            color: kLightThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 36),
        displayMedium: TextStyle(
            color: kLightThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        displaySmall: TextStyle(
            color: kLightThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 17),
        headlineMedium: TextStyle(
            color: kLightThemeTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        headlineSmall: TextStyle(
            color: kLightThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        titleLarge: TextStyle(
            color: kLightThemeTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 13),
        bodyLarge: TextStyle(
            color: kLightThemeTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 12),
        bodyMedium: TextStyle(
            color: kLightThemeTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 10),
        titleMedium: TextStyle(
            color: kLightThemeTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ));
}

ThemeData peachTheme() {
  return ThemeData(
      iconTheme: const IconThemeData(
        color: Color.fromARGB(186, 255, 255, 255),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 221, 160, 140),
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
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: Color.fromARGB(255, 221, 160, 140),
        hourMinuteShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        dayPeriodTextColor: kPeachThemeTextColor,
        dayPeriodShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hourMinuteColor: kPeachScaffoldBackgroundColor,
        hourMinuteTextColor: kPeachThemeTextColor,
        dialHandColor: Color.fromARGB(160, 221, 160, 140),
        dialBackgroundColor: kPeachScaffoldBackgroundColor,
        hourMinuteTextStyle: TextStyle(
            color: kPeachThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 25),
        dayPeriodTextStyle: TextStyle(
            color: kPeachThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        helpTextStyle: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
        dialTextColor: kPeachThemeTextColor,
        entryModeIconColor: kPeachScaffoldBackgroundColor,
      ),
      disabledColor: Colors.black87,
      hintColor: const Color.fromARGB(160, 221, 160, 140),
      primaryColor: const Color.fromARGB(255, 202, 107, 75),
      scaffoldBackgroundColor: kPeachScaffoldBackgroundColor,
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
      iconTheme: const IconThemeData(
        color: Color.fromARGB(186, 255, 255, 255),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 140, 182, 221),
          foregroundColor: kBlueThemeTextColor,
          elevation: 3),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: Color.fromARGB(255, 140, 182, 221),
        hourMinuteShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        dayPeriodTextColor: kBlueThemeTextColor,
        dayPeriodShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hourMinuteColor: kBlueScaffoldBackgroundColor,
        hourMinuteTextColor: kBlueThemeTextColor,
        dialHandColor: Color.fromARGB(159, 140, 178, 221),
        dialBackgroundColor: kBlueScaffoldBackgroundColor,
        hourMinuteTextStyle: TextStyle(
            color: kBlueThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 25),
        dayPeriodTextStyle: TextStyle(
            color: kBlueThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        helpTextStyle: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
        dialTextColor: kBlueThemeTextColor,
        entryModeIconColor: kBlueScaffoldBackgroundColor,
      ),
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
      hintColor: const Color.fromARGB(159, 140, 178, 221),
      primaryColor: const Color.fromARGB(255, 69, 126, 179),
      scaffoldBackgroundColor: kBlueScaffoldBackgroundColor,
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
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 240, 239, 239),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 175, 224, 212),
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
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: Color.fromARGB(255, 175, 224, 212),
        hourMinuteShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        dayPeriodTextColor: kSeaThemeTextColor,
        dayPeriodShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hourMinuteColor: kSeaScaffoldBackgroundColor,
        hourMinuteTextColor: kSeaThemeTextColor,
        dialHandColor: Color.fromARGB(193, 181, 196, 201),
        dialBackgroundColor: kSeaScaffoldBackgroundColor,
        hourMinuteTextStyle: TextStyle(
            color: kSeaThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 25),
        dayPeriodTextStyle: TextStyle(
            color: kSeaThemeTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        helpTextStyle: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
        dialTextColor: kSeaThemeTextColor,
        entryModeIconColor: kSeaScaffoldBackgroundColor,
      ),
      disabledColor: Colors.black87,
      hintColor: const Color.fromARGB(193, 181, 196, 201),
      primaryColor: const Color.fromARGB(255, 164, 126, 196),
      scaffoldBackgroundColor: kSeaScaffoldBackgroundColor,
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
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.black87,
          elevation: 3),
      scaffoldBackgroundColor: kContentColorLightTheme,
      hintColor: Colors.white38,
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: kAppBarColor,
      ),
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
