import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/task_list_bloc/tasks_list_bloc.dart';
import 'package:listta_clone_app/domain/helper/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTableWidget extends StatefulWidget {
  const CalendarTableWidget({super.key});

  @override
  _CalendarTableWidgetState createState() => _CalendarTableWidgetState();
}

class _CalendarTableWidgetState extends State<CalendarTableWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _currentDay = DateTime.now();

  DateTime? _selectedDay;

  StartingDayOfWeek startingDayOfWeek = StartingDayOfWeek.monday;

  List<Event> _getEventsForDay(DateTime day, DateTime newDate) {
    kEventSource.addAll({
      newDate: [
        const Event('Today\'s Event 1'),
      ],
      kToday: [
        const Event('Today\'s Event 1'),
      ],
    });
    return kEvents[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        if (state.status.isOpen) {
          return Center(
              child: TableCalendar(
            availableCalendarFormats: const {
              CalendarFormat.month: 'Місяць',
              CalendarFormat.week: 'Тиждень'
            },
            headerStyle: HeaderStyle(
              headerPadding: const EdgeInsets.only(left: 30),
              leftChevronVisible: false,
              rightChevronIcon: IconButton(
                  onPressed: () {
                    BlocProvider.of<CalendarBloc>(context).add(
                      SelectFocusDate(focusDate: _currentDay),
                    );
                    _selectedDay = _currentDay;
                  },
                  icon: const Icon(Icons.today_rounded)),
              formatButtonDecoration: const BoxDecoration(
                  border: Border.fromBorderSide(BorderSide()),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(
                        fontWeight: FontWeight.w400, color: Colors.black54),
                weekdayStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(
                        fontWeight: FontWeight.w400, color: Colors.black54)),
            calendarStyle: CalendarStyle(
                // markerDecoration: BoxDecoration(color: Colors.red),
                // markerSize: 25,
                todayDecoration: BoxDecoration(
                    color: Theme.of(context).hintColor, shape: BoxShape.circle),
                selectedDecoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle),
                outsideTextStyle: Theme.of(context).textTheme.labelMedium!,
                weekendTextStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w500),
                defaultTextStyle:
                    Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        )),
            rowHeight: 40,
            daysOfWeekHeight: 25,
            startingDayOfWeek: startingDayOfWeek,
            weekendDays: const [DateTime.saturday, DateTime.sunday],
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: state.focusDate,
            calendarFormat: _calendarFormat,
            locale: 'uk_UA',
            // eventLoader: (day) {
            //   return _getEventsForDay(day, model.tasks);
            // },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                BlocProvider.of<CalendarBloc>(context).add(
                  SelectFocusDate(focusDate: selectedDay),
                );
                BlocProvider.of<TaskListBloc>(context).add(
                  SelectTaskDate(taskDate: selectedDay),
                );
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
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
          ));
        } else if (state.status.isClosed) {
          return Container();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
