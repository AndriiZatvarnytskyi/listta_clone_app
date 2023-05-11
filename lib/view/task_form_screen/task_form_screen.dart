import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
import 'package:listta_clone_app/domain/helper/utils.dart';
import 'package:listta_clone_app/view/calendar_table_widget.dart';
import 'package:listta_clone_app/view/task_form_screen/widgets/task_form_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/tasks_screen.dart';
import 'package:listta_clone_app/widgets/sliding_up_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../blocs/task_list_bloc/tasks_list_bloc.dart';
import '../../blocs/theme_cubit/theme_cubit.dart';

class TaskFormScreen extends StatefulWidget {
  const TaskFormScreen({super.key});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  PanelController panelController = PanelController();

  FocusNode myFocus = FocusNode();

  TextEditingController controller = TextEditingController();

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
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Stack(
        children: [
          slidingUpWidget(
              panelHeightOpen: MediaQuery.of(context).size.height * .5,
              context: context,
              children: [
                CalendarTableWidget(
                  panelController: panelController,
                )
              ],
              panelController: panelController),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TaskFormWidget(controller, myFocus),
                TextButton(
                    onPressed: () async {
                      // final DateTime? date = await showDatePicker(
                      //   //locale: Locale('uk'),
                      //   firstDate: DateTime(2020, 01, 01),
                      //   lastDate: DateTime(2026, 01, 01),
                      //   context: context,
                      //   initialDate: DateTime.now(),
                      //   builder: (context, child) {
                      //     return Theme(
                      //       data: context.read<ThemeCubit>().state.copyWith(
                      //             dialogTheme: DialogTheme(
                      //                 backgroundColor: Theme.of(context)
                      //                     .scaffoldBackgroundColor),
                      //             colorScheme: ColorScheme.light(
                      //               primary:
                      //                   Theme.of(context).appBarTheme.backgroundColor!,
                      //               onPrimary: Theme.of(context)
                      //                   .textTheme
                      //                   .headlineMedium!
                      //                   .color!,
                      //               onSurface: Theme.of(context)
                      //                   .textTheme
                      //                   .headlineMedium!
                      //                   .color!,
                      //             ),
                      //           ),
                      //       child: child!,
                      //     );
                      //   },
                      // );
                      // if (date != null) {
                      //   context
                      //       .read<CalendarBloc>()
                      //       .add(SelectFocusDate(focusDate: date));
                      // }

                      // // if (date != null) {
                      // //   kEventSource.addAll({
                      // //     date: [const Event('')]
                      // //   });
                      // // }
                      // //panelController.open();
                      // myFocus.unfocus();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_calendar_outlined,
                          size: 15,
                          color:
                              Theme.of(context).textTheme.headlineLarge!.color,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat('EEEE, MMM d, y', 'uk_UA')
                              .format(
                                  context.read<CalendarBloc>().state.focusDate)
                              .toUpperCase()
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TaskCubit>().saveTask();
          BlocProvider.of<TaskListBloc>(context).add(
            SelectTaskDate(
                taskDate: context.read<CalendarBloc>().state.focusDate),
          );
          context.read<TaskCubit>().taskDate =
              context.read<CalendarBloc>().state.focusDate;

          Navigator.pop(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
