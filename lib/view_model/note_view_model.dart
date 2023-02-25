import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:listta_clone_app/domain/entity/note.dart';
import 'package:listta_clone_app/view/note_form_screen/note_form_screen.dart';
import '../domain/data_provider/box_manager.dart';

class NotesWidgetModel extends ChangeNotifier {
  late final Future<Box<Note>> _box;
  ValueListenable<Object>? _listenableBox;

  var _notes = <Note>[];

  List<Note> get notes => _notes.toList();

  NotesWidgetModel() {
    _setup();
  }

  // void showForm(BuildContext context, DateTime selectedDay) {
  //   Navigator.of(context)
  //       .pushNamed(MainNavigationRouteNames.addTask, arguments: selectedDay);
  // }

  Future<void> nameChange(int noteIndex, String name) async {
    final note = (await _box).getAt(noteIndex);
    note?.name = name;
    await note?.save();
  }

  Future<void> descriptionChange(int noteIndex, String description) async {
    final note = (await _box).getAt(noteIndex);
    note?.description = description;
    await note?.save();
  }

  void showForm(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NoteFormScreen()));
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

  Future<void> deleteNote(int noteIndex) async {
    final box = (await _box);

    await box.deleteAt(noteIndex);
  }

  Future<void> _readNotesFromHive() async {
    _notes = (await _box).values.toList();
    notifyListeners();
  }

  Future<void> _setup() async {
    _box = BoxManager.instance.openNoteBox();
    await _readNotesFromHive();
    _listenableBox = (await _box).listenable();
    _listenableBox?.addListener(_readNotesFromHive);
  }

  // Future<void> doneToggle(int taskIndex) async {
  //   final task = (await _box).getAt(taskIndex);
  //   task?.isDone = !task.isDone;
  //   await task?.save();
  // }

  @override
  Future<void> dispose() async {
    _listenableBox?.removeListener(_readNotesFromHive);
    await BoxManager.instance.closeBox((await _box));
    super.dispose();
  }
}

class NotesWidgetModelProvider extends InheritedNotifier {
  final NotesWidgetModel model;
  const NotesWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static NotesWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NotesWidgetModelProvider>();
  }

  static NotesWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NotesWidgetModelProvider>()
        ?.widget;
    return widget is NotesWidgetModelProvider ? widget : null;
  }
}
