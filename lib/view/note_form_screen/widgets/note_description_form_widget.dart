import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/note_cubit/note_cubit.dart';

class NoteDescriptionFormWidget extends StatelessWidget {
  const NoteDescriptionFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 20,
      style: Theme.of(context).textTheme.headlineMedium,
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Опис',
        hintStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).hintColor),
      ),
      onChanged: (value) => context.read<NoteCubit>().description = value,
    );
  }
}
