import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';

class UserProgresWidget extends StatefulWidget {
  const UserProgresWidget({super.key});

  @override
  State<UserProgresWidget> createState() => _UserProgresWidgetState();
}

class _UserProgresWidgetState extends State<UserProgresWidget> {
  @override
  Widget build(BuildContext context) {
    final model = TasksWidgetModelProvider.watch(context)!.model;

    final task = model.tasks
        .where((element) =>
            element.date.day ==
            context.read<CalendarBloc>().state.focusDate.day)
        .toList();
    final taskDone =
        task.where((element) => element.isDone).toList().length.toString();
    final taskLenght = task.length.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(
            Icons.person,
            color: Theme.of(context).textTheme.displayMedium!.color,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Прогрес сьогодні($taskDone/$taskLenght)',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
