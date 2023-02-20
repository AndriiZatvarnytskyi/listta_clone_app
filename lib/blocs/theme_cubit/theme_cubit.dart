import 'package:bloc/bloc.dart';
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

  void toggleBrightness() {
    emit(state == lightTheme() ? darkTheme() : lightTheme());
  }

  @override
  ThemeData? fromJson(Map<String, dynamic> json) {
    try {
      if (json['light'] as bool) return lightTheme();
      return darkTheme();
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, bool>? toJson(ThemeData state) {
    try {
      return {'light': state == darkTheme()};
    } catch (_) {
      return null;
    }
  }
}
