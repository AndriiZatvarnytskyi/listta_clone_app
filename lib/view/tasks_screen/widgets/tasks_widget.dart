import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/empty_task_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/task_list_widget.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';

class TasksWidget extends StatelessWidget {
  final _model = TasksWidgetModel();

  TasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TasksWidgetModelProvider(
      model: _model,
      child: const _TasksWidgetBody(),
    );
  }
}

class _TasksWidgetBody extends StatelessWidget {
  const _TasksWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (TasksWidgetModelProvider.watch(context)!.model.tasks.isNotEmpty) {
      return const TasksListWidget();
    } else if (TasksWidgetModelProvider.watch(context)!.model.tasks.isEmpty) {
      return const EmptyTaskWidget();
    } else {
      return const CircularProgressIndicator();
    }
    // TasksWidgetModelProvider.watch(context)!.model.tasks.isNotEmpty
    //     ? TasksListWidget()
    //     : const EmptyTaskWidget();
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () =>
    //       GroupsWidgetModelProvider.read(context)?.model.showForm(context),
    //   child: const Icon(Icons.add),
  }
}
