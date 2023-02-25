import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/note_cubit/note_cubit.dart';

class NoteNameFormWidget extends StatelessWidget {
  const NoteNameFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        textCapitalization: TextCapitalization.sentences,
        maxLength: 25,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Назва',
          hintStyle: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Theme.of(context).hintColor),
        ),
        onChanged: (value) => context.read<NoteCubit>().noteName = value,
        onEditingComplete: () {
          context.read<NoteCubit>().saveNote();
          Navigator.pop(context);
        });
  }
}
