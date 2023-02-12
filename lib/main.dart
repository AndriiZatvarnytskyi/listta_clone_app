import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:listta_clone_app/config/app_router.dart';
import 'package:listta_clone_app/config/theme.dart';
import 'package:listta_clone_app/view/screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      //home: const ScreenView(),
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      initialRoute: mainNavigation.initialRoute,
    );
  }
}
