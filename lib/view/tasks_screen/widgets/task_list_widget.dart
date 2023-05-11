import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/task_list_bloc/tasks_list_bloc.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/empty_task_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/task_list_row_widget.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TasksListWidget extends StatefulWidget {
  const TasksListWidget({
    required this.panelController,
    super.key,
  });
  final PanelController panelController;

  @override
  State<TasksListWidget> createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListBloc, TaskListState>(
      builder: (context, state) {
        final model = TasksWidgetModelProvider.watch(context)!.model;

        final task = model.tasks
            .where((element) =>
                element.date.day == state.taskDate.day &&
                element.date.month == state.taskDate.month &&
                element.date.year == state.taskDate.year)
            .toList();
        return task.isNotEmpty
            ? Column(
                children: [
                  ListView.builder(
                    physics: const ScrollPhysics(
                        parent: NeverScrollableScrollPhysics()),
                    shrinkWrap: true,
                    itemCount: task.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return TasksListRowWidget(
                        panelController: widget.panelController,
                        indexInList: index,
                        tasks: task,
                        date: state.taskDate,
                      );
                    },
                  ),
                  // ListView.builder(
                  //   physics: const ScrollPhysics(
                  //       parent: NeverScrollableScrollPhysics()),
                  //   shrinkWrap: true,
                  //   itemCount: lowPriority.length,
                  //   itemBuilder: (
                  //     BuildContext context,
                  //     int index,
                  //   ) {
                  //     return TasksListRowWidget(
                  //       key: Key(index.toString()),
                  //       panelController: widget.panelController,
                  //       indexInList: index,
                  //       tasks: lowPriority,
                  //       date: state.taskDate,
                  //     );
                  //   },
                  // ),
                ],
              )
            : const EmptyTaskWidget();
      },
    );
  }
}
