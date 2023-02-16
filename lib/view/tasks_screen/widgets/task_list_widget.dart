import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/task_list_bloc/tasks_list_bloc.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/task_list_row_widget.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';

class TasksListWidget extends StatefulWidget {
  const TasksListWidget({super.key});

  @override
  State<TasksListWidget> createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  @override
  Widget build(BuildContext context) {
    final tasksCount =
        TasksWidgetModelProvider.watch(context)?.model.tasks.length ?? 0;
    return BlocBuilder<TaskListBloc, TaskListState>(
      builder: (context, state) {
        return ListView.builder(
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          itemCount: tasksCount,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return TasksListRowWidget(
              indexInList: index,
              date: state.taskDate,
            );
          },
          // separatorBuilder: (BuildContext context, int index) {
          //   return const Divider(height: 1);
          // },
        );
      },
    );
  }
}
