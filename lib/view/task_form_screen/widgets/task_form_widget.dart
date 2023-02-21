import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';

class TaskFormWidget extends StatelessWidget {
  TaskFormWidget(this.controller, this.myFocus);
  TextEditingController controller;
  FocusNode myFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        maxLength: 50,
        focusNode: myFocus,
        controller: controller,
        style: Theme.of(context).textTheme.headlineMedium,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Назва',
          hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.w500, color: Theme.of(context).hintColor),
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
      ),
    );
  }
}
