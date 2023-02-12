import 'package:flutter/material.dart';
import 'package:listta_clone_app/view_model/note_view_model.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';
import 'package:intl/intl.dart';

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
        padding: const EdgeInsets.only(right: 10),
        alignment: AlignmentDirectional.centerEnd,
        color: Colors.red.shade400,
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 35),
      ),
      onDismissed: (direction) {
        model.deleteNote(indexInList);
      },
      direction: DismissDirection.endToStart,
      child: ListTile(
        title: Text(
          note.name,
          //style: style,
        ),
        leading: Icon(Icons.note),
        // onTap: () => model.doneToggle(indexInList),
      ),
    );
  }
}
