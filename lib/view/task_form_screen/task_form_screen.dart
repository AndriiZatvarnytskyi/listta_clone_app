import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
import 'package:listta_clone_app/view/calendar_table_widget.dart';
import 'package:listta_clone_app/view/task_form_screen/widgets/task_form_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TaskFormScreen extends StatefulWidget {
  const TaskFormScreen({super.key});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final double _initFabHeight = 120.0;
  PanelController panelController = PanelController();

  double _fabHeight = 0;
  FocusNode myFocus = FocusNode();

  double _panelHeightOpen = 0;

  double _panelHeightClosed = 0.0;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .50;
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
          SlidingUpPanel(
            color: Theme.of(context).appBarTheme.color!,
            controller: panelController,
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TaskFormWidget(controller, myFocus),
                TextButton(
                    onPressed: () {
                      panelController.open();
                      myFocus.unfocus();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_calendar_outlined,
                          color: Theme.of(context).iconTheme.color!,
                        ),
                        const SizedBox(
                          width: 10,
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
          Navigator.pop(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: const <Widget>[CalendarTableWidget()],
        ));
  }

  Widget _button(String label, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 8.0,
                )
              ]),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }
}
