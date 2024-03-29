import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/domain/data_provider/box_manager.dart';
import 'package:listta_clone_app/domain/entity/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<int> {
  TaskCubit() : super(0);

  var taskName = '';
  DateTime? notificationTime;
  bool isDone = false;
  DateTime taskDate = DateTime.now();
  bool isHighPriority = false;
  int? index;

  void changeIndex(int newIndex) {
    emit(newIndex);
  }

  void saveTask() async {
    if (taskName.isEmpty) return;
    final box = await BoxManager.instance.openTaskBox();
    final task = Task(
        text: taskName,
        isDone: isDone,
        date: taskDate,
        notificationTime: notificationTime,
        isHighPriority: isHighPriority);
    await box.add(task);
    await BoxManager.instance.closeBox(box);
  }

  // Future<void> _readTasksFromHive() async {
  //   _tasks = (await _box).values.toList();
  // }
}
