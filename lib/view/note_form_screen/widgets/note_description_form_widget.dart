import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/note_cubit/note_cubit.dart';

class NoteDescriptionFormWidget extends StatelessWidget {
  const NoteDescriptionFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      maxLines: 20,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 18),
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Опис',
        hintStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).hintColor, fontSize: 18),
      ),
      onChanged: (value) => context.read<NoteCubit>().description = value,
    );
  }
}
