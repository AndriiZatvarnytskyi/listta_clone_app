import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
import 'package:listta_clone_app/blocs/task_list_bloc/tasks_list_bloc.dart';

// ignore: must_be_immutable
class TaskFormWidget extends StatefulWidget {
  TaskFormWidget(this.controller, this.myFocus, {super.key});
  TextEditingController controller;
  FocusNode myFocus;

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        maxLength: 50,
        focusNode: widget.myFocus,
        controller: widget.controller,
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
        },
        onEditingComplete: () {
          context.read<TaskCubit>().saveTask();
          BlocProvider.of<TaskListBloc>(context).add(
            SelectTaskDate(
                taskDate: context.read<CalendarBloc>().state.focusDate),
          );
          context.read<TaskCubit>().taskDate =
              context.read<CalendarBloc>().state.focusDate;

          Navigator.pop(context);
        },
      ),
    );
  }
}
