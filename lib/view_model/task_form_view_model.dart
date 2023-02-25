import 'package:flutter/material.dart';

class TaskFormWidgetModel {
  var taskName = '';
  bool isDone = false;
  DateTime taskDate = DateTime.now();

  // void saveTask(BuildContext context) async {
  //   if (taskName.isEmpty) return;
  //   final box = await BoxManager.instance.openTaskBox();
  //   final task = Task(
  //     text: taskName,
  //     isDone: isDone,
  //     date: taskDate,
  //   );
  //   await box.add(task);
  //   await BoxManager.instance.closeBox(box);
  //   Navigator.of(context).pop();
  // }
}

class TaskFormWidgetModelProvider extends InheritedWidget {
  final TaskFormWidgetModel model;
  const TaskFormWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static TaskFormWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TaskFormWidgetModelProvider>();
  }

  static TaskFormWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TaskFormWidgetModelProvider>()
        ?.widget;
    return widget is TaskFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(TaskFormWidgetModelProvider oldWidget) {
    return false;
  }
}
