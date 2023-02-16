import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:listta_clone_app/domain/data_provider/box_manager.dart';
import 'package:listta_clone_app/domain/entity/note.dart';
import 'package:listta_clone_app/domain/entity/task.dart';
import 'package:listta_clone_app/repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  var taskName = '';
  bool isDone = false;
  DateTime taskDate = DateTime.now();

  void saveTask() async {
    if (taskName.isEmpty) return;
    final box = await BoxManager.instance.openTaskBox();
    final task = Task(
      text: taskName,
      isDone: isDone,
      date: taskDate,
    );
    await box.add(task);
    await BoxManager.instance.closeBox(box);
  }
}
