import 'package:flutter/material.dart';
import 'package:listta_clone_app/domain/entity/task.dart';
import 'package:listta_clone_app/view/task_edition_screen/task_edition_screen.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';

class TasksListRowWidget extends StatelessWidget {
  final int indexInList;
  final DateTime date;
  final List<Task> tasks;
  const TasksListRowWidget({
    super.key,
    required this.date,
    required this.tasks,
    required this.indexInList,
  });

  @override
  Widget build(BuildContext context) {
    final model = TasksWidgetModelProvider.read(context)!.model;
    final task = tasks[indexInList];
    final taskIndex = model.tasks.indexWhere((element) =>
        element.text == tasks[indexInList].text &&
        element.date == tasks[indexInList].date);

    final icon = task.isDone ? Icons.check_box : Icons.check_box_outline_blank;
    final color = task.isDone
        ? Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(0.3)
        : Theme.of(context).textTheme.headlineMedium!.color;

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
      ),
      onDismissed: (direction) {
        model.deleteTask(taskIndex);
      },
      direction: DismissDirection.endToStart,
      child: ListTile(
        trailing: IconButton(
            icon: Icon(Icons.edit, color: color),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TaskEditionScreen(
                    taskName: tasks[indexInList].text,
                    taskIndex: taskIndex,
                  ),
                ),
              );
            }),
        title: Text(
          tasks[indexInList].text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: color),
        ),
        leading: IconButton(
          splashRadius: 20,
          icon: Icon(
            icon,
            color: color,
          ),
          onPressed: () => model.doneToggle(taskIndex),
        ),
      ),
    );
  }
}
