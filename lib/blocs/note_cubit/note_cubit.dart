import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/domain/data_provider/box_manager.dart';
import 'package:listta_clone_app/domain/entity/note.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  dynamic noteName;
  dynamic description;

  Future<void> deleteNote(
    int noteIndex,
  ) async {
    final box = await BoxManager.instance.openNoteBox();
    final note = (box).getAt(noteIndex);
    note!.delete();
  }

  Future<void> noteChange(
      {required int noteIndex,
      required String name,
      required String description}) async {
    final box = await BoxManager.instance.openNoteBox();
    final note = (box).getAt(noteIndex);
    if (name.isEmpty) {
      if (description.isNotEmpty) {
        note!.name = description;

        await note.save();
      } else {
        await note!.delete();
      }
    } else {
      note?.description = description;
      await note?.save();
      note?.name = name;
      await note?.save();
    }
  }

  void saveNote() async {
    if (noteName.isEmpty && description.isEmpty) {
      return;
    } else if (noteName.isEmpty && description != null) {
      noteName = description;

      final box = await BoxManager.instance.openNoteBox();
      final note = Note(
        description: description,
        name: noteName,
      );
      await box.add(note);
      await BoxManager.instance.closeBox(box);
      noteName = '';
      description = '';
    } else {
      final box = await BoxManager.instance.openNoteBox();
      final note = Note(
        description: description ?? '',
        name: noteName,
      );
      await box.add(note);
      await BoxManager.instance.closeBox(box);
      noteName = '';
      description = '';
    }
  }
}
