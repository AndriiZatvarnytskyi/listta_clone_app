import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
import 'package:listta_clone_app/view_model/task_form_view_model.dart';
import 'package:listta_clone_app/view/task_form_screen/widgets/task_form_widget.dart';

class TaskFormScreen extends StatelessWidget {
  const TaskFormScreen({super.key});

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
          'Створити завдання',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TaskFormWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TaskCubit>().saveTask();
          Navigator.pop(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
