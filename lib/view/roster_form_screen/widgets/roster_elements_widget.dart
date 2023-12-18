import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/roster_form_screen/widgets/roster_element_list_widget.dart';
import 'package:listta_clone_app/view_model/roster_view_model.dart';

class RosterElementsWidget extends StatelessWidget {
  final _model = RosterWidgetModel();

  RosterElementsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RosterWidgetModelProvider(
      model: _model,
      child: const _RosterElementWidgetBody(),
    );
  }
}

class _RosterElementWidgetBody extends StatelessWidget {
  const _RosterElementWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RosterElementListWidget();
  }
}
