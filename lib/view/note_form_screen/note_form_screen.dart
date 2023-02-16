import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/note_cubit/note_cubit.dart';
import 'package:listta_clone_app/view/note_form_screen/widgets/note_description_form_widget.dart';
import 'package:listta_clone_app/view_model/task_form_view_model.dart';
import 'package:listta_clone_app/view/task_form_screen/widgets/task_form_widget.dart';

import '../../view_model/note_form_view_model.dart';
import 'widgets/note_name_form_widget.dart';

class NoteFormScreen extends StatelessWidget {
  NoteFormScreen({super.key});

  final _model = NoteFormWidgetModel();

  @override
  Widget build(BuildContext context) {
    return NoteFormWidgetModelProvider(
      model: _model,
      child: _NoteFormScreenBody(),
    );
  }
}

class _NoteFormScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: IconButton(
            icon: const Icon(
              Icons.close,
              size: 22,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'Нова нотатка',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: const [
            NoteNameFormWidget(),
            Expanded(child: NoteDescriptionFormWidget())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<NoteCubit>().saveNote();
          Navigator.pop(context);
        },
        // NoteFormWidgetModelProvider.read(context)?.model.saveNote(context),
        child: const Icon(Icons.done),
      ),
    );
  }
}
