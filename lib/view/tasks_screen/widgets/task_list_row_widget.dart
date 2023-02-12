import 'package:flutter/material.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';
import 'package:intl/intl.dart';

class TasksListRowWidget extends StatelessWidget {
  final int indexInList;
  const TasksListRowWidget({
    super.key,
    required this.indexInList,
  });

  @override
  Widget build(BuildContext context) {
    final model = TasksWidgetModelProvider.read(context)!.model;
    final task = model.tasks[indexInList];

    final icon = task.isDone ? Icons.check_box : Icons.check_box_outline_blank;
    final style = task.isDone
        ? Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Theme.of(context).primaryColor)
        : Theme.of(context).textTheme.headline4;

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.only(right: 10),
        alignment: AlignmentDirectional.centerEnd,
        color: Colors.red.shade400,
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 35),
      ),
      onDismissed: (direction) {
        model.deleteTask(indexInList);
      },
      direction: DismissDirection.endToStart,
      child: ListTile(
        //subtitle: Text(DateFormat('EEEE, d MMM, yyyy').format(task.date)),
        title: Text(
          task.text,
          style: style,
        ),
        leading: Icon(icon),
        onTap: () => model.doneToggle(indexInList),
      ),
    );
  }
}
