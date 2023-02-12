// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CalendarViewModel {
//   // var taskName = '';
//   // bool isDone = false;
//   // DateTime taskDate = DateTime.now();
//   CalendarFormat calendarFormat = CalendarFormat.month;
//   final DateTime currentDay = DateTime.now();
//   DateTime focusedDay = DateTime.now();

//   DateTime? selectedDay;

//   //bool weekNumbersVisible = true;
//   StartingDayOfWeek startingDayOfWeek = StartingDayOfWeek.monday;

//   void backToToday() {
//     focusedDay = currentDay;
//     selectedDay = currentDay;
//   }

//   void onFormatChanged(format) {
//     if (calendarFormat != format) {
//       calendarFormat = format;
//     }
//   }

//   void onPageChanged(DateTime newFocusedDay) {
//     // No need to call `setState()` here
//     focusedDay = newFocusedDay;
//   }

//   // void saveTask(BuildContext context) async {
//   //   if (taskName.isEmpty) return;
//   //   final box = await BoxManager.instance.openTaskBox();
//   //   final task = Task(
//   //     text: taskName,
//   //     isDone: isDone,
//   //     date: taskDate,
//   //   );
//   //   await box.add(task);
//   //   await BoxManager.instance.closeBox(box);
//   //   Navigator.of(context).pop();
//   // }
// }

// class CalendarViewModelProvider extends InheritedWidget {
//   final CalendarViewModel model;
//   const CalendarViewModelProvider({
//     Key? key,
//     required this.model,
//     required Widget child,
//   }) : super(
//           key: key,
//           child: child,
//         );

//   static CalendarViewModelProvider? watch(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<CalendarViewModelProvider>();
//   }

//   static CalendarViewModelProvider? read(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<CalendarViewModelProvider>()
//         ?.widget;
//     return widget is CalendarViewModelProvider ? widget : null;
//   }

//   @override
//   bool updateShouldNotify(CalendarViewModelProvider oldWidget) {
//     return false;
//   }
// }
