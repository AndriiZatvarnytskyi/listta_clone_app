import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/task_form_screen/task_form_screen.dart';
import 'package:listta_clone_app/view/tasks_screen/tasks_screen.dart';

import '../view/screen_view.dart';

abstract class MainNavigationRouteNames {
  static const tasks = 'tasks';
  static const addTask = 'tasks-form';
  static const screens = 'screens';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.screens;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.screens: (context) => const ScreenView(),
    //MainNavigationRouteNames.addTask: (context) => const TaskFormScreen(groupKey: null,),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.arguments) {
      // case MainNavigationRouteNames.addTask:
      //   final selectedDay = settings.arguments;
      //   return MaterialPageRoute(
      //     builder: (context) => TaskFormScreen(
      //       selectedDays: selectedDay as DateTime,
      //     ),
      //   );
      case MainNavigationRouteNames.addTask:
        final selectedDay = settings.arguments as DateTime;
        return MaterialPageRoute(
          builder: (context) {
            return TaskFormScreen(
              selectedDays: selectedDay,
            );
          },
        );
      default:
        const widget = Center(child: Text('Navigation error!!!'));
        return MaterialPageRoute(builder: (context) => widget);
    }
  }

  MainNavigation();
}

//import 'package:flutter/material.dart';
// import 'package:todo/screens/screens.dart';

// abstract class MainNavigationRouteNames {
//   static const groups = '/';
//   static const addGroup = '/groups/form';
//   static const tasks = '/groups/tasks';
//   static const addTask = '/groups/tasks/form';
// }

// class MainNavigation {
//   final initialRoute = MainNavigationRouteNames.groups;
//   final routes = <String, Widget Function(BuildContext)>{
//     MainNavigationRouteNames.groups: (context) => const GroupsWidget(),
//     MainNavigationRouteNames.addGroup: (context) => const GroupFormWidget(),
//   };

//   Route<Object> onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case MainNavigationRouteNames.tasks:
//         final configuration = settings.arguments as TasksWidgetConfiguration;
//         return MaterialPageRoute(
//           builder: (context) => TasksWidget(
//             configuration: configuration,
//           ),
//         );
//       case MainNavigationRouteNames.addTask:
//         final groupKey = settings.arguments as int;
//         return MaterialPageRoute(
//           builder: (context) {
//             return TaskFormWidget(groupKey: groupKey);
//           },
//         );
//       default:
//         const widget = Text('Navigation error!!!');
//         return MaterialPageRoute(builder: (context) => widget);
//     }
//   }

//   MainNavigation();
// }
