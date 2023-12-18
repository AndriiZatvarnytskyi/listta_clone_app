// import 'package:flutter/material.dart';
// import 'package:listta_clone_app/view/roster_form_screen/widgets/roster_element_list_row_widget.dart';
// import 'package:listta_clone_app/view/roster_form_screen/widgets/roster_list_row_widget.dart';
// import 'package:listta_clone_app/view_model/roster_view_model.dart';

// class RosterElementListWidget extends StatefulWidget {
//   const RosterElementListWidget({
//     super.key,
//   });

//   @override
//   State<RosterElementListWidget> createState() =>
//       _RosterElementListWidgetState();
// }

// class _RosterElementListWidgetState extends State<RosterElementListWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final rosterIndex =
//         RosterWidgetModelProvider.watch(context)!.model.rosters.length - 1;
//     final rosterElementsCount = RosterWidgetModelProvider.watch(context)
//             ?.model
//             .rosters[rosterIndex]
//             .elevents
//             .length ??
//         0;
//     return ListView.separated(
//       physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//       shrinkWrap: true,
//       itemCount: rosterElementsCount,
//       itemBuilder: (BuildContext context, int index) {
//         return RosterElementListRowWidget(
//           indexInList: index,
//           rosterIndex: rosterIndex,
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return const SizedBox(
//           height: 10,
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/roster_cubit/roster_cubit.dart';
import 'package:listta_clone_app/view/roster_form_screen/widgets/roster_element_list_row_widget.dart';
import 'package:listta_clone_app/view/roster_form_screen/widgets/roster_list_row_widget.dart';
import 'package:listta_clone_app/view_model/roster_view_model.dart';

class RosterElementListWidget extends StatelessWidget {
  const RosterElementListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final rosterIndex =
        RosterWidgetModelProvider.watch(context)!.model.rosters.length - 1;
    final rosterElementsCount = context.read<RosterCubit>().elements.length;
    return ListView.separated(
      physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      shrinkWrap: true,
      itemCount: rosterElementsCount,
      itemBuilder: (BuildContext context, int index) {
        return RosterElementListRowWidget(
          indexInList: index,
          rosterIndex: rosterIndex,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
