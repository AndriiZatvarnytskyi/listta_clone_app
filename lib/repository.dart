import 'package:flutter/material.dart';
import 'package:listta_clone_app/domain/data_provider/box_manager.dart';
import 'package:listta_clone_app/domain/entity/note.dart';

class AddNoteRepository {
  Future<void> saveNote(
    BuildContext context,
    String noteName,
    String description,
  ) async {
    if (noteName.isEmpty) return;
    final box = await BoxManager.instance.openNoteBox();
    final note = Note(
      description: description,
      name: noteName,
    );
    await box.add(note);
    await BoxManager.instance.closeBox(box);
    Navigator.of(context).pop();
  }
}
