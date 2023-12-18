import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/task_list_bloc/tasks_list_bloc.dart';
import 'package:listta_clone_app/domain/helper/utils.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CalendarTableWidget extends StatefulWidget {
  const CalendarTableWidget({super.key, required this.panelController});
  final PanelController panelController;

  @override
  State<CalendarTableWidget> createState() => _CalendarTableWidgetState();
}

class _CalendarTableWidgetState extends State<CalendarTableWidget> {
  late final TasksWidgetModel _model;

  @override
  void initState() {
    super.initState();
    _model = TasksWidgetModel();
  }

  @override
  Widget build(BuildContext context) {
    return TasksWidgetModelProvider(
      model: _model,
      child: CalendarTableWidgetBody(panelController: widget.panelController),
    );
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
}

class CalendarTableWidgetBody extends StatefulWidget {
  const CalendarTableWidgetBody({super.key, required this.panelController});
  final PanelController panelController;

  @override
  State<CalendarTableWidgetBody> createState() =>
      _CalendarTableWidgetBodyState();
}

class _CalendarTableWidgetBodyState extends State<CalendarTableWidgetBody> {
  final DateTime _currentDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        DateTime? calendarSelectedDay = state.focusDate;

        StartingDayOfWeek startingDayOfWeek = StartingDayOfWeek.monday;
        final model = TasksWidgetModelProvider.watch(context)?.model;
        final tasks = model?.tasks;
        final Map<DateTime, List<Event>> events = tasks != null
            ? {
                for (var element in tasks) element.date: [Event(element.text)]
              }
            : {};
        List<Event> getEventsForDay(
          DateTime day,
        ) {
          return events[day] ?? [];
        }

        if (state.status.isOpen) {
          return Center(
              child: TasksWidgetModelProvider(
            model: TasksWidgetModel(),
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
                      widget.panelController.close();
                      BlocProvider.of<CalendarBloc>(context).add(
                        SelectFocusDate(focusDate: _currentDay),
                      );
                      calendarSelectedDay = _currentDay;
                    },
                    icon: Icon(
                      Icons.today_rounded,
                      color: Theme.of(context).textTheme.headlineMedium!.color,
                    )),
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
                  markerDecoration: BoxDecoration(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      borderRadius: BorderRadius.circular(100)),
                  markerMargin: EdgeInsets.zero,
                  markersAnchor: 1.5,
                  markersMaxCount: 999,
                  markerSize: 4,
                  todayDecoration: BoxDecoration(
                      color: Theme.of(context).hintColor,
                      shape: BoxShape.circle),
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
              rowHeight: 42,
              daysOfWeekHeight: 25,
              startingDayOfWeek: startingDayOfWeek,
              weekendDays: const [DateTime.saturday, DateTime.sunday],
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: state.focusDate,
              calendarFormat: _calendarFormat,
              locale: 'uk_UA',
              eventLoader: getEventsForDay,
              selectedDayPredicate: (day) {
                return isSameDay(calendarSelectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(calendarSelectedDay, selectedDay)) {
                  widget.panelController.close();
                  BlocProvider.of<CalendarBloc>(context).add(
                    SelectFocusDate(focusDate: selectedDay),
                  );
                  BlocProvider.of<TaskListBloc>(context).add(
                    SelectTaskDate(taskDate: selectedDay),
                  );
                  setState(() {
                    calendarSelectedDay = selectedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  widget.panelController.close();
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
            ),
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
