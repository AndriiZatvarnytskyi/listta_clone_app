import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:listta_clone_app/config/theme.dart';
import 'package:listta_clone_app/notification/noti.dart';
import 'package:path_provider/path_provider.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;
// ignore: unused_import, depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/note_cubit/note_cubit.dart';
import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
import 'package:listta_clone_app/blocs/task_list_bloc/tasks_list_bloc.dart';
import 'package:listta_clone_app/blocs/theme_cubit/theme_cubit.dart';
import 'package:listta_clone_app/config/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  tz.initializeTimeZones();
  await NotificationService().initNotification();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => NoteCubit()),
        BlocProvider(create: (_) => TaskCubit()),
        BlocProvider(create: (_) => CalendarBloc()),
        BlocProvider(create: (_) => TaskListBloc()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: theme,
            routes: mainNavigation.routes,
            onGenerateRoute: mainNavigation.onGenerateRoute,
            initialRoute: mainNavigation.initialRoute,
          );
        },
      ),
    );
  }
}
