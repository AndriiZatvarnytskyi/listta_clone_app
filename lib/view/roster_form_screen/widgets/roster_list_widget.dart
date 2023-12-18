import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/roster_form_screen/widgets/roster_list_row_widget.dart';
import 'package:listta_clone_app/view_model/roster_view_model.dart';

class RosterListWidget extends StatefulWidget {
  const RosterListWidget({super.key});

  @override
  State<RosterListWidget> createState() => _RosterListWidgetState();
}

class _RosterListWidgetState extends State<RosterListWidget> {
  @override
  Widget build(BuildContext context) {
    final rosterCount =
        RosterWidgetModelProvider.watch(context)?.model.rosters.length ?? 0;
    return ListView.separated(
      physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      shrinkWrap: true,
      itemCount: rosterCount,
      itemBuilder: (BuildContext context, int index) {
        return RosterListRowWidget(indexInList: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
