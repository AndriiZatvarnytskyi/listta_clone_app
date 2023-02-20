import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/domain/data_provider/box_manager.dart';
import 'package:listta_clone_app/domain/entity/note.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  dynamic noteName;
  dynamic description = '';

  void saveNote() async {
    if (noteName.isEmpty) return;
    final box = await BoxManager.instance.openNoteBox();
    final note = Note(
      description: description,
      name: noteName,
    );
    await box.add(note);
    await BoxManager.instance.closeBox(box);
  }
}
