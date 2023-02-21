import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/view/calendar_table_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/user_progres_widget.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/tasks_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({
    super.key,
  });

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late bool calendarIsActive = true;
  @override
  Widget build(BuildContext context) {
    return TasksWidgetModelProvider(
      model: TasksWidgetModel(),
      child: Builder(builder: (context) {
        return Scaffold(
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              TasksWidgetModelProvider.read(context)?.model.showForm(
                    context,
                  );
            },
            child: const Icon(Icons.add),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UserProgresWidget(),
                  calendarIsActive == true
                      ? const CalendarTableWidget()
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: BlocBuilder<CalendarBloc, CalendarState>(
                        builder: (context, state) => Text(
                          state.focusDate.day == DateTime.now().day &&
                                  state.focusDate.month ==
                                      DateTime.now().month &&
                                  state.focusDate.year == DateTime.now().year
                              ? 'СЬОГОДНІ'
                              : DateFormat('EEEE, MMM d', 'uk_UA')
                                  .format(state.focusDate)
                                  .toUpperCase()
                                  .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                          textAlign: TextAlign.left,
                        ),
                      )),
                  TasksWidget(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
