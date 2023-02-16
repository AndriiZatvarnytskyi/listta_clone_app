import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/note_cubit/note_cubit.dart';
import 'package:listta_clone_app/view_model/task_form_view_model.dart';

import '../../../view_model/note_form_view_model.dart';

class NoteNameFormWidget extends StatelessWidget {
  const NoteNameFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final noteName;
    final model = NoteFormWidgetModelProvider.read(context)?.model;
    return TextField(
        maxLength: 25,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Назва',
          hintStyle: Theme.of(context).textTheme.headline3!.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor),
        ),
        onChanged: (value) => context.read<NoteCubit>().noteName = value,
        onEditingComplete: () {
          context.read<NoteCubit>().saveNote();
          Navigator.pop(context);
        });
  }
}
