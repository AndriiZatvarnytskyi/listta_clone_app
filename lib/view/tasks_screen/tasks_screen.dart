import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
import 'package:listta_clone_app/domain/helper/utils.dart';
import 'package:listta_clone_app/view/calendar_table_widget.dart';
import 'package:listta_clone_app/view/task_form_screen/widgets/task_form_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/sliding_list_row_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/sliding_list_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/task_list_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/user_progres_widget.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/widgets/sliding_up_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({
    super.key,
  });

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late bool calendarIsActive = true;
  final PanelController panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    return TasksWidgetModelProvider(
      model: TasksWidgetModel(),
      child: Builder(builder: (context) {
        return Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UserProgresWidget(),
                    calendarIsActive == true
                        ? CalendarTableWidget(
                            panelController: panelController,
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: BlocBuilder<CalendarBloc, CalendarState>(
                          builder: (context, state) => Text(
                            state.focusDate.day == DateTime.now().day &&
                                    state.focusDate.month ==
                                        DateTime.now().month &&
                                    state.focusDate.year == DateTime.now().year
                                ? 'СЬОГОДНІ'
                                : DateFormat('EEEE, MMM d', 'uk_UA')
                                    .format(state.focusDate)
                                    .toUpperCase()
                                    .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                            textAlign: TextAlign.left,
                          ),
                        )),
                    TasksListWidget(
                      panelController: panelController,
                    ),
                  ],
                ),
              ),
              slidingUpWidget(
                  panelHeightOpen: MediaQuery.of(context).size.height * 0.35,
                  context: context,
                  panelController: panelController,
                  children: [
                    SlidingListWidget(settingsPanelController: panelController)
                  ]),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 12),
            child: FloatingActionButton(
              onPressed: () {
                TasksWidgetModelProvider.read(context)?.model.showForm(
                      context,
                    );
              },
              child: const Icon(Icons.add),
            ),
          ),
        );
      }),
    );
  }
}
