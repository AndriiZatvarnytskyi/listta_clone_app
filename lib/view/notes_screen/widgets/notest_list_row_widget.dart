import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/note_edition_screen/note_edition_screen.dart';
import 'package:listta_clone_app/view_model/note_view_model.dart';

class NotesListRowWidget extends StatelessWidget {
  final int indexInList;
  const NotesListRowWidget({
    super.key,
    required this.indexInList,
  });

  @override
  Widget build(BuildContext context) {
    final model = NotesWidgetModelProvider.read(context)!.model;
    final note = model.notes[indexInList];

    // final icon = note.isDone ? Icons.check_box : Icons.check_box_outline_blank;
    // final style = note.isDone
    //  ?
    // const TextStyle(
    //     decoration: TextDecoration.lineThrough,
    //   )
    // : null;

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
      ),
      onDismissed: (direction) {
        model.deleteNote(indexInList);
      },
      direction: DismissDirection.endToStart,
      child: ListTile(
        title: Text(
          note.name,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NoteEditionScreen(
                noteDescription: note.description,
                noteName: note.name,
                noteIndex: indexInList,
              ),
            ),
          );
        },
      ),
    );
  }
}
