import 'package:flutter/material.dart';
import 'package:listta_clone_app/view_model/task_form_view_model.dart';

import '../../../view_model/note_form_view_model.dart';

class NoteDescriptionFormWidget extends StatelessWidget {
  const NoteDescriptionFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NoteFormWidgetModelProvider.read(context)?.model;
    return TextField(
      maxLines: 20,
      style: Theme.of(context).textTheme.headline4,
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Опис',
        hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
            fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),
      ),
      onChanged: (value) => model?.noteDescription = value,
      onEditingComplete: () => model?.saveNote(context),
    );
  }
}
