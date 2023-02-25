import 'package:flutter/material.dart';
import 'package:listta_clone_app/domain/entity/task.dart';
import 'package:listta_clone_app/domain/helper/utils.dart';
import 'package:listta_clone_app/notification/noti.dart';
import 'package:listta_clone_app/view/task_edition_screen/task_edition_screen.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';

class TasksListRowWidget extends StatefulWidget {
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
  State<TasksListRowWidget> createState() => _TasksListRowWidgetState();
}

class _TasksListRowWidgetState extends State<TasksListRowWidget> {
  @override
  Widget build(BuildContext context) {
    final model = TasksWidgetModelProvider.read(context)!.model;
    final task = widget.tasks[widget.indexInList];
    final taskIndex = model.tasks.indexWhere((element) =>
        element.text == widget.tasks[widget.indexInList].text &&
        element.date == widget.tasks[widget.indexInList].date);

    final icon = task.isDone ? Icons.check_box : Icons.check_box_outline_blank;
    final color = task.isDone
        ? Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(0.3)
        : Theme.of(context).textTheme.headlineMedium!.color;
    DateTime? taskNotiTime = widget.tasks[widget.indexInList].notificationTime;

    String taskNotiTimeMinute = taskNotiTime?.minute.toString().length == 1
        ? '0${taskNotiTime?.minute.toString()}'
        : '${taskNotiTime?.minute.toString()}';

    String taskNotiTimeHour = taskNotiTime?.hour.toString().length == 1
        ? '0${taskNotiTime?.hour.toString()}'
        : '${taskNotiTime?.hour.toString()}';

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
      ),
      onDismissed: (direction) {
        model.deleteTask(taskIndex);
        if (widget.tasks.length == 1) {
          kEventSource.removeWhere((key, value) => key == task.date);
        }
      },
      direction: DismissDirection.endToStart,
      child: ListTile(
        trailing: SizedBox(
          width: 100,
          child: Row(children: [
            IconButton(
                icon: Icon(Icons.notification_add, color: color),
                onPressed: () async {
                  final TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (time == null) {
                    return;
                  }

                  notification(taskIndex, task, time);

                  await model.addNotification(
                      taskIndex,
                      DateTime(task.date.year, task.date.month, task.date.day,
                          time.hour, time.minute));
                }),
            IconButton(
                icon: Icon(Icons.edit, color: color),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TaskEditionScreen(
                        taskName: widget.tasks[widget.indexInList].text,
                        taskIndex: taskIndex,
                      ),
                    ),
                  );
                }),
          ]),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.tasks[widget.indexInList].text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: color),
            ),
            widget.tasks[widget.indexInList].notificationTime != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).hintColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 5),
                            child: Row(
                              children: [
                                const Icon(Icons.notifications_active,
                                    size: 13),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '$taskNotiTimeHour:$taskNotiTimeMinute',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: color, letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
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

  void notification(int taskIndex, Task task, TimeOfDay time) {
    NotificationService().showNotification(
        context: context,
        id: taskIndex,
        title: " Не забудь: ${task.text})",
        year: task.date.year,
        month: task.date.month,
        day: task.date.day,
        hour: time.hour,
        minut: time.minute);
  }
}
