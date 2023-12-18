import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/roster_screen/widgets/empty_task_widget.dart';
import 'package:listta_clone_app/view/roster_screen/widgets/rosters_list_row_widget.dart';
import 'package:listta_clone_app/view_model/roster_view_model.dart';

class RostersListWidget extends StatefulWidget {
  const RostersListWidget({
    super.key,
  });

  @override
  State<RostersListWidget> createState() => _RostersListWidgetState();
}

class _RostersListWidgetState extends State<RostersListWidget> {
  @override
  Widget build(BuildContext context) {
    final model = RosterWidgetModelProvider.watch(context)!.model;
    final rosters = model.rosters;

    return rosters.isNotEmpty
        ? SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    physics: const ScrollPhysics(
                        parent: NeverScrollableScrollPhysics()),
                    shrinkWrap: true,
                    itemCount: rosters.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return RostersListRowWidget(
                        indexInList: index,
                        roster: rosters,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          )
        : const EmptyTaskWidget();
  }
}
