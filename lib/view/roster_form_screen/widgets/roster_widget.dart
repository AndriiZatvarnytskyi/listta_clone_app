import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/roster_form_screen/widgets/roster_list_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/empty_task_widget.dart';
import 'package:listta_clone_app/view_model/roster_view_model.dart';

class RosterWidget extends StatefulWidget {
  RosterWidget({super.key});

  @override
  State<RosterWidget> createState() => _RosterWidgetState();
}

class _RosterWidgetState extends State<RosterWidget> {
  final _model = RosterWidgetModel();

  @override
  Widget build(BuildContext context) {
    return RosterWidgetModelProvider(
      model: _model,
      child: const _RosterWidgetBody(),
    );
  }
}

class _RosterWidgetBody extends StatelessWidget {
  const _RosterWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (RosterWidgetModelProvider.watch(context)!.model.rosters.isNotEmpty) {
      return const RosterListWidget();
    } else {
      return const EmptyTaskWidget();
    }
  }
}
