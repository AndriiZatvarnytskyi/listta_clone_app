import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/task_list_bloc/tasks_list_bloc.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';

class UserProgresWidget extends StatefulWidget {
  const UserProgresWidget({super.key});

  @override
  State<UserProgresWidget> createState() => _UserProgresWidgetState();
}

class _UserProgresWidgetState extends State<UserProgresWidget> {
  late final TasksWidgetModel _model;

  @override
  void initState() {
    super.initState();
    _model = TasksWidgetModel();
  }

  @override
  Widget build(BuildContext context) {
    return TasksWidgetModelProvider(
      model: _model,
      child: const UserProgresWidgetBody(),
    );
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
}

class UserProgresWidgetBody extends StatefulWidget {
  const UserProgresWidgetBody({super.key});

  @override
  State<UserProgresWidgetBody> createState() => _UserProgresWidgetBodyState();
}

class _UserProgresWidgetBodyState extends State<UserProgresWidgetBody> {
  String _taskLenght = '0';
  String _taskDone = '0';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListBloc, TaskListState>(builder: (context, state) {
      final model = TasksWidgetModelProvider.watch(context)?.model;
      if (model != null) {
        final task = model.tasks
            .where((element) => element.date.day == state.taskDate.day)
            .toList();
        _taskDone =
            task.where((element) => element.isDone).toList().length.toString();
        _taskLenght = task.length.toString();
      }

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
              'Прогрес сьогодні($_taskDone/$_taskLenght)',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.w400),
            )
          ],
        ),
      );
    });
  }
}
