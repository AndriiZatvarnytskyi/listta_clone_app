import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:listta_clone_app/config/theme.dart';

part 'theme_state.dart';

// class ThemeCubit extends Cubit<ThemeData> {
//   ThemeCubit() : super(lightTheme());

//   void toggleTheme() {
//     if (state == lightTheme()) {
//       emit(darkTheme());
//     } else {
//       emit(lightTheme());
//     }
//   }
// }

class ThemeCubit extends HydratedCubit<ThemeData> {
  ThemeCubit() : super(lightTheme());

  void theme() {
    emit(state == lightTheme() ? darkTheme() : lightTheme());
  }

  void changeThemeToLight() {
    emit(lightTheme());
  }

  void changeThemeToDark() {
    emit(darkTheme());
  }

  void changeThemeToPeach() {
    emit(peachTheme());
  }

  void changeThemeToSea() {
    emit(seaTheme());
  }

  void changeThemeToBlue() {
    emit(blueTheme());
  }

  @override
  ThemeData? fromJson(Map<String, dynamic> json) {
    try {
      if (json['light'] as bool) return lightTheme();
      if (json['dark'] as bool) return darkTheme();
      if (json['peach'] as bool) return peachTheme();
      if (json['sea'] as bool) return seaTheme();
      if (json['blue'] as bool) return blueTheme();
      return lightTheme();
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, bool>? toJson(ThemeData state) {
    try {
      return {
        'light': state == lightTheme(),
        'dark': state == darkTheme(),
        'peach': state == peachTheme(),
        'sea': state == seaTheme(),
        'blue': state == blueTheme(),
      };
    } catch (_) {
      return null;
    }
  }
}
