import 'dart:collection';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:listta_clone_app/domain/helper/utils.dart';
import 'package:listta_clone_app/view/task_form_screen/task_form_screen.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTableWidget extends StatefulWidget {
  @override
  _CalendarTableWidgetState createState() => _CalendarTableWidgetState();
}

class _CalendarTableWidgetState extends State<CalendarTableWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _currentDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  //bool weekNumbersVisible = true;
  StartingDayOfWeek startingDayOfWeek = StartingDayOfWeek.monday;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TasksWidgetModelProvider(
        model: TasksWidgetModel(),
        child: Builder(builder: (context) {
          return TableCalendar(
            availableCalendarFormats: const {
              CalendarFormat.month: 'Місяць',
              CalendarFormat.week: 'Тиждень'
            },
            headerStyle: HeaderStyle(
              headerPadding: const EdgeInsets.only(left: 30),
              leftChevronVisible: false,
              rightChevronIcon: IconButton(
                  onPressed: () {
                    TasksWidgetModelProvider.read(context)!
                        .model
                        .showForm(context);
                  },
                  icon: const Icon(Icons.today_rounded)),
              formatButtonDecoration: const BoxDecoration(
                  border: Border.fromBorderSide(BorderSide()),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w400, color: Colors.black38),
                weekdayStyle: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w400, color: Colors.black38)),
            calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle),
                selectedDecoration: BoxDecoration(
                    color: Theme.of(context).toggleableActiveColor,
                    shape: BoxShape.circle),
                outsideTextStyle: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(
                        fontWeight: FontWeight.w400, color: Colors.black38),
                weekendTextStyle: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w500),
                defaultTextStyle: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w500)),
            rowHeight: 40,
            daysOfWeekHeight: 25,
            startingDayOfWeek: startingDayOfWeek,
            weekendDays: const [DateTime.saturday, DateTime.sunday],
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  TasksWidgetModelProvider.read(context)!
                      .model
                      .changeSelectedDay(selectedDay);
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },

            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            // onFormatChanged: (format) {
            //   setState(() {
            //     //_selectedDay = selectedDay;

            //     _focusedDay = _currentDay;
            //     _selectedDay = _currentDay;
            //   });
            // },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          );
        }),
      ),
    );
  }
}

void backToToday(today, focusedDay) {
  focusedDay = today;
}

// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0


