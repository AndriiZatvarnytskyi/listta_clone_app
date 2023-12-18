import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
import 'package:listta_clone_app/blocs/theme_cubit/theme_cubit.dart';
import 'package:listta_clone_app/notification/noti.dart';
import 'package:listta_clone_app/view/task_edition_screen/task_edition_screen.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/sliding_list_row_widget.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';

// ignore: implementation_imports
import 'package:sliding_up_panel/src/panel.dart';

class SlidingListWidget extends StatefulWidget {
  const SlidingListWidget({
    super.key,
    required this.settingsPanelController,
  });
  final PanelController settingsPanelController;

  @override
  State<SlidingListWidget> createState() => _SlidingListWidgetState();
}

class _SlidingListWidgetState extends State<SlidingListWidget> {
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
      child: SlidingListWidgetBody(
        settingsPanelController: widget.settingsPanelController,
      ),
    );
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
}

class SlidingListWidgetBody extends StatefulWidget {
  const SlidingListWidgetBody({
    super.key,
    required this.settingsPanelController,
  });
  final PanelController settingsPanelController;

  @override
  State<SlidingListWidgetBody> createState() => _SlidingListWidgetBodyState();
}

class _SlidingListWidgetBodyState extends State<SlidingListWidgetBody> {
  @override
  Widget build(BuildContext context) {
    //final taskIndex = BlocProvider.of<TaskCubit>(context).index ?? 0;

    final model = TasksWidgetModelProvider.watch(context)!.model;
    if (model.tasks.isNotEmpty) {
      return BlocBuilder<TaskCubit, int>(builder: (context, taskIndex) {
        if (taskIndex < model.tasks.length) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                title(context, model, taskIndex),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    color: Theme.of(context).hintColor,
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      //dateChange(context, model, taskIndex),
                      editTask(context, model, taskIndex),
                      addNotification(context, taskIndex, model),
                      changePriority(model, taskIndex),
                      daleteTask(context, model, taskIndex),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      });
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  TaskSettingsListRowWiget daleteTask(
      BuildContext context, TasksWidgetModel model, int taskIndex) {
    return TaskSettingsListRowWiget(
        newColor: Colors.red,
        icon: Icons.delete_outline_rounded,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    child: Text('НІ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.white)),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        model.deleteTask(taskIndex);
                        widget.settingsPanelController.close();
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red.shade600)),
                      child: Text('ТАК',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white)))
                ],
                title: Text(
                  'Видалити це завдання?',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 16),
                ),
              );
            },
          );
          // model.deleteTask(state.index);
          // widget.settingsPanelController.close();
        },
        title: 'Видалити');
  }

  TaskSettingsListRowWiget changePriority(
      TasksWidgetModel model, int taskIndex) {
    return TaskSettingsListRowWiget(
        icon: Icons.priority_high_rounded,
        onTap: () {
          if (model.tasks[taskIndex].isHighPriority != null) {
            model.highPriorityToggle(taskIndex);
            widget.settingsPanelController.close();
          }
          return;
        },
        title: model.tasks[taskIndex].isHighPriority == false
            ? 'Вствновити високий пріорітет'
            : 'Зняти високий пріорітет');
  }

  TaskSettingsListRowWiget addNotification(
      BuildContext context, int taskIndex, TasksWidgetModel model) {
    return TaskSettingsListRowWiget(
        icon: Icons.notification_add,
        onTap: () async {
          final TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) {
              return Theme(
                  data: context.read<ThemeCubit>().state.copyWith(
                        timePickerTheme: Theme.of(context).timePickerTheme,
                        textButtonTheme: TextButtonThemeData(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Theme.of(context).hintColor),
                            foregroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.white),
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                  child: child!);
            },
          );

          if (time == null) {
            return;
          }

          notification(taskIndex, model.tasks[taskIndex], time);

          await model.addNotification(
              taskIndex,
              DateTime(
                  model.tasks[taskIndex].date.year,
                  model.tasks[taskIndex].date.month,
                  model.tasks[taskIndex].date.day,
                  time.hour,
                  time.minute));
          widget.settingsPanelController.close();
        },
        title: model.tasks[taskIndex].notificationTime == null
            ? 'Встановити нагадування'
            : 'Змінити час нагадування');
  }

  TaskSettingsListRowWiget editTask(
      BuildContext context, TasksWidgetModel model, int taskIndex) {
    return TaskSettingsListRowWiget(
        icon: Icons.edit,
        title: 'Редагувати завдання',
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TaskEditionScreen(
                settingsPanelController: widget.settingsPanelController,
                taskName: model.tasks[taskIndex].text,
                taskIndex: taskIndex,
              ),
            ),
          );
        });
  }

  TaskSettingsListRowWiget dateChange(
      BuildContext context, TasksWidgetModel model, int taskIndex) {
    return TaskSettingsListRowWiget(
        icon: Icons.edit_calendar_outlined,
        onTap: () async {
          final DateTime? date = await showDatePicker(
            //locale: Locale('uk'),
            firstDate: DateTime(2020, 01, 01),
            lastDate: DateTime(2026, 01, 01),
            context: context,
            initialDate: DateTime.now(),
            builder: (context, child) {
              return Theme(
                data: context.read<ThemeCubit>().state.copyWith(
                      dialogTheme: DialogTheme(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor),
                      colorScheme: ColorScheme.light(
                        primary: Theme.of(context).appBarTheme.backgroundColor!,
                        onPrimary:
                            Theme.of(context).textTheme.headlineMedium!.color!,
                        onSurface:
                            Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                    ),
                child: child!,
              );
            },
          );
          if (date != null) {
            model.dateChange(taskIndex, date);
          }
        },
        title: taskIndex.toString());
  }

  Padding title(BuildContext context, TasksWidgetModel model, int taskIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: () {
          widget.settingsPanelController.close();
        },
        child: Row(
          children: [
            Icon(
              Icons.backspace_outlined,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              model.tasks[taskIndex].text.length < 20
                  ? model.tasks[taskIndex].text.toUpperCase()
                  : model.tasks[taskIndex].text
                      .toUpperCase()
                      .substring(0, 20)
                      .padRight(23, '.'),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 22, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }

  void notification(int taskIndex, task, TimeOfDay time) {
    NotificationService().showNotification(
        context: context,
        id: taskIndex,
        title: " Не забудь: ${task.text})",
        year: task.date.year,
        month: task.date.month,
        day: task.date.day,
        hour: time.hour,
        minut: time.minute);
  }
}
