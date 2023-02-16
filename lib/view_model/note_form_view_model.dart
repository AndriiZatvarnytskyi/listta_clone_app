import 'package:flutter/material.dart';

import '../domain/data_provider/box_manager.dart';
import '../domain/entity/note.dart';

class NoteFormWidgetModel {
  var noteName = '';
  var noteDescription = '';

  void saveNote(BuildContext context) async {
    if (noteName.isEmpty) return;
    final box = await BoxManager.instance.openNoteBox();
    final note = Note(
      description: noteDescription,
      name: noteName,
    );
    await box.add(note);
    await BoxManager.instance.closeBox(box);
    Navigator.of(context).pop();
  }
}

class NoteFormWidgetModelProvider extends InheritedWidget {
  final NoteFormWidgetModel model;
  const NoteFormWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static NoteFormWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NoteFormWidgetModelProvider>();
  }

  static NoteFormWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NoteFormWidgetModelProvider>()
        ?.widget;
    return widget is NoteFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(NoteFormWidgetModelProvider oldWidget) {
    return false;
  }
}
