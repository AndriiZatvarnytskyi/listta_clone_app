import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:listta_clone_app/domain/entity/note.dart';

import '../entity/task.dart';

class BoxManager {
  static final BoxManager instance = BoxManager._();
  final Map<String, int> _boxCounter = <String, int>{};

  BoxManager._();
  Future<Box<Task>> openTaskBox() async {
    return _openBox('tasks_box', 1, TaskAdapter());
  }

  Future<Box<Note>> openNoteBox() async {
    return _openBox('note_box', 2, NoteAdapter());
  }

  Future<void> closeBox<T>(Box<T> box) async {
    if (!box.isOpen) {
      _boxCounter.remove(box.name);
      return;
    }

    final count = _boxCounter[box.name] ?? 1;
    _boxCounter[box.name] = count - 1;
    if (count > 0) return;

    _boxCounter.remove(box.name);
    await box.compact();
    await box.close();
  }

  String makeTaskBoxName(int groupKey) => 'tasks_box_$groupKey';

  Future<Box<T>> _openBox<T>(
    String name,
    int typeId,
    TypeAdapter<T> adapter,
  ) async {
    if (Hive.isBoxOpen(name)) {
      final count = _boxCounter[name] ?? 1;
      _boxCounter[name] = count + 1;
      return Hive.box(name);
    }
    _boxCounter[name] = 1;
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
    return Hive.openBox<T>(name);
  }
}
