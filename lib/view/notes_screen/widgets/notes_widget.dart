import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/notes_screen/widgets/notes_list_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/empty_task_widget.dart';

import '../../../view_model/note_view_model.dart';

class NotesWidget extends StatelessWidget {
  final _model = NotesWidgetModel();

  NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NotesWidgetModelProvider(
      model: _model,
      child: const _NotesWidgetBody(),
    );
  }
}

class _NotesWidgetBody extends StatelessWidget {
  const _NotesWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (NotesWidgetModelProvider.watch(context)!.model.notes.isNotEmpty) {
      return const NotesListWidget();
    } else if (NotesWidgetModelProvider.watch(context)!.model.notes.isEmpty) {
      return const EmptyTaskWidget();
    } else {
      return const CircularProgressIndicator();
    }
  }
}
