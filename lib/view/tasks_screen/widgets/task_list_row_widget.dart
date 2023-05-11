// import 'package:flutter/material.dart';
// import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
// import 'package:listta_clone_app/domain/entity/task.dart';
// import 'package:listta_clone_app/domain/helper/utils.dart';
// import 'package:listta_clone_app/notification/noti.dart';
// import 'package:listta_clone_app/view/task_edition_screen/task_edition_screen.dart';
// import 'package:listta_clone_app/view/tasks_screen/widgets/notification_add_widget.dart';
// import 'package:listta_clone_app/view/tasks_screen/widgets/sliding_list_widget.dart';
// import 'package:listta_clone_app/view_model/tasks_view_model.dart';
// import 'package:listta_clone_app/blocs/theme_cubit/theme_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:listta_clone_app/widgets/sliding_up_widget.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

// import '../../../blocs/bloc/sliding_settings_bloc.dart';

// class TasksListRowWidget extends StatefulWidget {
//   final int indexInList;
//   final DateTime date;
//   final List<Task> tasks;

//   final PanelController panelController;
//   const TasksListRowWidget({
//     super.key,
//     required this.date,
//     required this.tasks,
//     required this.indexInList,
//     required this.panelController,
//   });

//   @override
//   State<TasksListRowWidget> createState() => _TasksListRowWidgetState();
// }

// class _TasksListRowWidgetState extends State<TasksListRowWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final model = TasksWidgetModelProvider.read(context)!.model;
//     final task = widget.tasks[widget.indexInList];
//     final taskIndex = model.tasks.indexWhere((element) =>
//         element.text == widget.tasks[widget.indexInList].text &&
//         element.date == widget.tasks[widget.indexInList].date);

//     final icon = task.isDone ? Icons.check_box : Icons.check_box_outline_blank;
//     final color = task.isDone
//         ? Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(0.3)
//         : task.isHighPriority!
//             ? Theme.of(context).primaryColor
//             : Theme.of(context).textTheme.headlineMedium!.color;
//     DateTime? taskNotiTime = widget.tasks[widget.indexInList].notificationTime;

//     String taskNotiTimeMinute = taskNotiTime?.minute.toString().length == 1
//         ? '0${taskNotiTime?.minute.toString()}'
//         : '${taskNotiTime?.minute.toString()}';

//     String taskNotiTimeHour = taskNotiTime?.hour.toString().length == 1
//         ? '0${taskNotiTime?.hour.toString()}'
//         : '${taskNotiTime?.hour.toString()}';

//     return ListTile(
//       trailing: IconButton(
//           icon: Icon(Icons.more_vert, color: color),
//           onPressed: () {
//             BlocProvider.of<SlidingSettingsBloc>(context).add(OpenSettings(
//               index: taskIndex,
//             ));

//             widget.panelController.open();
//             setState(() {});
//           }),
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             widget.tasks[widget.indexInList].text,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: Theme.of(context)
//                 .textTheme
//                 .headlineMedium!
//                 .copyWith(color: color),
//           ),
//           widget.tasks[widget.indexInList].notificationTime != null
//               ? Padding(
//                   padding: const EdgeInsets.only(top: 3.0),
//                   child: Row(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Theme.of(context).hintColor,
//                             borderRadius: BorderRadius.circular(5)),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 3, horizontal: 5),
//                           child: Row(
//                             children: [
//                               const Icon(Icons.notifications_active, size: 13),
//                               const SizedBox(
//                                 width: 3,
//                               ),
//                               Text(
//                                 '$taskNotiTimeHour:$taskNotiTimeMinute',
//                                 overflow: TextOverflow.ellipsis,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge!
//                                     .copyWith(color: color, letterSpacing: 1),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               : const SizedBox(),
//         ],
//       ),
//       leading: IconButton(
//         splashRadius: 20,
//         icon: Icon(
//           icon,
//           color: color,
//         ),
//         onPressed: () => model.doneToggle(taskIndex),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
import 'package:listta_clone_app/blocs/theme_cubit/theme_cubit.dart';
import 'package:listta_clone_app/domain/entity/task.dart';
import 'package:listta_clone_app/domain/helper/utils.dart';
import 'package:listta_clone_app/notification/noti.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../blocs/bloc/sliding_settings_bloc.dart';

class TasksListRowWidget extends StatefulWidget {
  final int indexInList;
  final DateTime date;
  final List<Task> tasks;
  final PanelController panelController;

  const TasksListRowWidget({
    super.key,
    required this.panelController,
    required this.date,
    required this.tasks,
    required this.indexInList,
  });

  @override
  State<TasksListRowWidget> createState() => _TasksListRowWidgetState();
}

class _TasksListRowWidgetState extends State<TasksListRowWidget> {
  @override
  Widget build(BuildContext context) {
    final model = TasksWidgetModelProvider.watch(context)!.model;
    final task = widget.tasks[widget.indexInList];
    final taskIndex = model.tasks
        .indexWhere((element) => element == widget.tasks[widget.indexInList]);

    final icon = task.isDone ? Icons.check_box : Icons.check_box_outline_blank;
    final color = task.isDone
        ? Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(0.3)
        : task.isHighPriority!
            ? Theme.of(context).primaryColor
            : Theme.of(context).textTheme.headlineMedium!.color;
    DateTime? taskNotiTime = widget.tasks[widget.indexInList].notificationTime;

    String taskNotiTimeMinute = taskNotiTime?.minute.toString().length == 1
        ? '0${taskNotiTime?.minute.toString()}'
        : '${taskNotiTime?.minute.toString()}';

    String taskNotiTimeHour = taskNotiTime?.hour.toString().length == 1
        ? '0${taskNotiTime?.hour.toString()}'
        : '${taskNotiTime?.hour.toString()}';

    return Container(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: Dismissible(
          key: UniqueKey(),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
          ),
          onDismissed: (direction) {
            model.deleteTask(taskIndex);
          },
          direction: DismissDirection.endToStart,
          child: ListTile(
            title: Row(children: [
              IconButton(
                splashRadius: 20,
                icon: Icon(
                  icon,
                  color: color,
                ),
                onPressed: () => model.doneToggle(taskIndex),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.tasks[widget.indexInList].text.length < 27
                        ? widget.tasks[widget.indexInList].text.toUpperCase()
                        : widget.tasks[widget.indexInList].text
                            .toUpperCase()
                            .substring(0, 27)
                            .padRight(30, '.'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: color),
                  ),
                  widget.tasks[widget.indexInList].notificationTime != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).hintColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 5),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.notifications_active,
                                          size: 13),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        '$taskNotiTimeHour:$taskNotiTimeMinute',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: color, letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const Expanded(child: SizedBox()),
              // IconButton(
              //   icon: Icon(Icons.notification_add, color: color),
              //   onPressed: () async {
              //     final TimeOfDay? time = await showTimePicker(
              //       context: context,
              //       initialTime: TimeOfDay.now(),
              //       builder: (context, child) {
              //         return Theme(
              //             data: context.read<ThemeCubit>().state.copyWith(
              //                   timePickerTheme: Theme.of(context).timePickerTheme,
              //                   textButtonTheme: TextButtonThemeData(
              //                     style: ButtonStyle(
              //                       backgroundColor: MaterialStateColor.resolveWith(
              //                           (states) => Theme.of(context).hintColor),
              //                       foregroundColor: MaterialStateColor.resolveWith(
              //                           (states) => Colors.white),
              //                       overlayColor: MaterialStateColor.resolveWith(
              //                           (states) => Theme.of(context).primaryColor),
              //                     ),
              //                   ),
              //                 ),
              //             child: child!);
              //       },
              //     );

              //     if (time == null) {
              //       return;
              //     }

              //     notification(taskIndex, model.tasks[taskIndex], time);

              //     await model.addNotification(
              //         taskIndex,
              //         DateTime(
              //             model.tasks[taskIndex].date.year,
              //             model.tasks[taskIndex].date.month,
              //             model.tasks[taskIndex].date.day,
              //             time.hour,
              //             time.minute));
              //   },
              // ),
              IconButton(
                  icon: Icon(Icons.more_vert_outlined, color: color),
                  onPressed: () {
                    BlocProvider.of<TaskCubit>(context).changeIndex(taskIndex);
                    widget.panelController.open();
                  }),
            ]),
          ),
        ));
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
