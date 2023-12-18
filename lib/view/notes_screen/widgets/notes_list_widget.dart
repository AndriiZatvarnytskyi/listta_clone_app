import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/notes_screen/widgets/notest_list_row_widget.dart';

import '../../../view_model/note_view_model.dart';

class NotesListWidget extends StatefulWidget {
  const NotesListWidget({super.key});

  @override
  State<NotesListWidget> createState() => _NotesListWidgetState();
}

class _NotesListWidgetState extends State<NotesListWidget> {
  @override
  Widget build(BuildContext context) {
    final notesCount =
        NotesWidgetModelProvider.watch(context)?.model.notes.length ?? 0;
    return ListView.separated(
      physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      shrinkWrap: true,
      itemCount: notesCount,
      itemBuilder: (BuildContext context, int index) {
        return NotesListRowWidget(indexInList: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
