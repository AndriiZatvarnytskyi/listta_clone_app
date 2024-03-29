import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:listta_clone_app/domain/entity/task.dart';
import '../domain/data_provider/box_manager.dart';
import '../view/task_form_screen/task_form_screen.dart';

class TasksWidgetModel extends ChangeNotifier {
  late final Future<Box<Task>> _box;
  ValueListenable<Object>? _listenableBox;
  DateTime? selectedDays;
  var _tasks = <Task>[];

  List<Task> get tasks => _tasks.toList();

  TasksWidgetModel() {
    _setup();
  }

  // void showForm(BuildContext context, DateTime selectedDay) {
  //   Navigator.of(context)
  //       .pushNamed(MainNavigationRouteNames.addTask, arguments: selectedDay);
  // }
  void saveTask(
    BuildContext context,
    DateTime taskDate,
    String taskName,
    bool? isHighPriority,
  ) async {
    final box = await BoxManager.instance.openTaskBox();
    final task = Task(
      notificationTime: DateTime.now(),
      text: taskName,
      isDone: false,
      date: taskDate,
      isHighPriority: isHighPriority ?? false,
    );
    await box.add(task);
    await BoxManager.instance.closeBox(box);
  }

  void changeSelectedDay(DateTime selectedDay) {
    selectedDays = selectedDay;
  }

  void showForm(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TaskFormScreen()));
  }

  // Future<void> showTasks(BuildContext context, int groupIndex) async {
  //   final group = (await _box).getAt(groupIndex);
  //   if (group != null) {
  //     final configuration = TasksWidgetConfiguration(
  //         groupKey: group.key as int, title: group.name);

  //     Navigator.of(context)
  //         .pushNamed(MainNavigationRouteNames.tasks, arguments: configuration);
  //   }
  // }

  Future<void> deleteTask(int taskIndex) async {
    final box = (await _box);
    final taskKey = (await _box).keyAt(taskIndex);
    final taskBoxName = BoxManager.instance.makeTaskBoxName(taskKey);
    await Hive.deleteBoxFromDisk(taskBoxName);
    await box.deleteAt(taskIndex);
  }

  Future<void> _readTasksFromHive() async {
    _tasks = (await _box).values.toList();
    notifyListeners();
  }

  Future<void> _setup() async {
    _box = BoxManager.instance.openTaskBox();
    await _readTasksFromHive();
    _listenableBox = (await _box).listenable();
    _listenableBox?.addListener(_readTasksFromHive);
  }

  Future<void> doneToggle(int taskIndex) async {
    final task = (await _box).getAt(taskIndex);
    task?.isDone = !task.isDone;
    await task?.save();
  }

  Future<void> highPriorityToggle(int taskIndex) async {
    final task = (await _box).getAt(taskIndex);
    if (task?.isHighPriority != null) {
      task?.isHighPriority = !task.isHighPriority!;
    }

    await task?.save();
  }

  Future<void> dateChange(int taskIndex, DateTime date) async {
    final task = (await _box).getAt(taskIndex);
    task?.date = date;
    await task?.save();
  }

  Future<void> addNotification(int taskIndex, DateTime notificationTime) async {
    final task = (await _box).getAt(taskIndex);
    task?.notificationTime = notificationTime;
    await task?.save();
  }

  Future<void> nameChange(int taskIndex, String text) async {
    final task = (await _box).getAt(taskIndex);
    task?.text = text;
    await task?.save();
  }

  @override
  Future<void> dispose() async {
    _listenableBox?.removeListener(_readTasksFromHive);
    await BoxManager.instance.closeBox((await _box));
    super.dispose();
  }
}

class TasksWidgetModelProvider extends InheritedNotifier {
  final TasksWidgetModel model;
  const TasksWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static TasksWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TasksWidgetModelProvider>();
  }

  static TasksWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TasksWidgetModelProvider>()
        ?.widget;
    return widget is TasksWidgetModelProvider ? widget : null;
  }
}
