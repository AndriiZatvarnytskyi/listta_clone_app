import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/theme_cubit/theme_cubit.dart';
import 'package:listta_clone_app/config/theme.dart';
import 'package:listta_clone_app/widgets/theme_list_tile.dart';

class ThemeList extends StatefulWidget {
  const ThemeList({super.key});

  @override
  State<ThemeList> createState() => _ThemeListState();
}

class _ThemeListState extends State<ThemeList> {
  double boxHW = 50;

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return SizedBox(
      height: MediaQuery.of(context).size.height * .6,
      child: SingleChildScrollView(
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            ThemeListTile(
              firstColor: lightTheme().appBarTheme.backgroundColor,
              secondColor: lightTheme().scaffoldBackgroundColor,
              onTap: () {
                themeCubit.changeThemeToLight();
              },
            ),
            ThemeListTile(
              firstColor: darkTheme().appBarTheme.backgroundColor,
              secondColor: darkTheme().scaffoldBackgroundColor,
              onTap: () {
                themeCubit.changeThemeToDark();
              },
            ),
            ThemeListTile(
              firstColor: peachTheme().appBarTheme.backgroundColor,
              secondColor: peachTheme().scaffoldBackgroundColor,
              onTap: () {
                themeCubit.changeThemeToPeach();
              },
            ),
            ThemeListTile(
              firstColor: seaTheme().appBarTheme.backgroundColor,
              secondColor: seaTheme().scaffoldBackgroundColor,
              onTap: () {
                themeCubit.changeThemeToSea();
              },
            ),
            ThemeListTile(
              firstColor: blueTheme().appBarTheme.backgroundColor,
              secondColor: blueTheme().scaffoldBackgroundColor,
              onTap: () {
                themeCubit.changeThemeToBlue();
              },
            ),
          ],
        ),
      ),
    );
  }
}
