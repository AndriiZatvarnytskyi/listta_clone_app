import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
import 'package:listta_clone_app/view_model/task_form_view_model.dart';

class TaskFormWidget extends StatelessWidget {
  const TaskFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.headline4,
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Назва',
        hintStyle: Theme.of(context).textTheme.headline3!.copyWith(
            fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),
      ),
      onChanged: (value) {
        context.read<TaskCubit>().taskName = value;
        context.read<TaskCubit>().taskDate =
            context.read<CalendarBloc>().state.focusDate;
      },
      onEditingComplete: () {
        context.read<TaskCubit>().saveTask();
        Navigator.pop(context);
      },
    );
  }
}
