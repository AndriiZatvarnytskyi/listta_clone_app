import 'package:flutter/material.dart';
import 'package:listta_clone_app/domain/entity/roster_element.dart';
import 'package:listta_clone_app/view/roster_edition_form_screen/widgets/roster_element_list_widget.dart';
import 'package:listta_clone_app/view_model/roster_view_model.dart';

class RosterElementsWidget extends StatelessWidget {
  final _model = RosterWidgetModel();
  List<RosterElement> elements;
  int rosterIndex;

  RosterElementsWidget(
      {super.key, required this.rosterIndex, required this.elements});

  @override
  Widget build(BuildContext context) {
    return RosterWidgetModelProvider(
      model: _model,
      child: RosterElementListWidget(
        rosterIndex: rosterIndex,
        elements: elements,
      ),
    );
  }
}
