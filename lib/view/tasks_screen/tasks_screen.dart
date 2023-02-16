import 'package:flutter/material.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/view/task_form_screen/task_form_screen.dart';
import 'package:listta_clone_app/view/calendar_table_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/user_progres_widget.dart';
import 'package:listta_clone_app/view_model/calendar_view_model.dart';
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
          appBar: AppBar(
            actions: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.search,
                  size: 25,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                  'assets/calendar.png',
                  height: 20,
                  width: 20,
                  color: calendarIsActive
                      ? Theme.of(context).toggleableActiveColor
                      : Theme.of(context).disabledColor,
                ),
                onPressed: () async {
                  setState(() {
                    calendarIsActive = !calendarIsActive;
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                icon: Image.asset(
                  'assets/setting.png',
                  height: 20,
                  width: 20,
                ),
                onPressed: () {},
              )
            ],
            leading: IconButton(
              icon: Image.asset(
                'assets/menu.png',
                height: 20,
                width: 20,
              ),
              onPressed: () {},
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              TasksWidgetModelProvider.read(context)?.model.showForm(context);
            },
            child: const Icon(Icons.add),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const UserProgresWidget(),
                calendarIsActive == true
                    ? CalendarTableWidget()
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                    padding: EdgeInsets.all(20),
                    child: BlocBuilder<CalendarBloc, CalendarState>(
                      builder: (context, state) =>
                          Text(state.focusDate.toString()),
                    )),

                Expanded(child: TasksWidget()),
                // TasksWidgetModelProvider.watch(context)!.model.tasks.isNotEmpty
                //     ? Expanded(child: TasksWidget())
                //     : const EmptyTaskWidget()
              ],
            ),
          ),
        );
      }),
    );
  }
}
