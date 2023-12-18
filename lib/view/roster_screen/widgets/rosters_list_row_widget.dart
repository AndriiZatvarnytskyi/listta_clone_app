import 'package:flutter/material.dart';
import 'package:listta_clone_app/blocs/roster_cubit/roster_cubit.dart';
import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
import 'package:listta_clone_app/domain/entity/task.dart';
import 'package:listta_clone_app/notification/noti.dart';
import 'package:listta_clone_app/view_model/roster_view_model.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../domain/entity/roster.dart';
import '../../roster_edition_form_screen/roster_edition_form_screen.dart';

class RostersListRowWidget extends StatefulWidget {
  final int indexInList;
  final List<Roster> roster;

  const RostersListRowWidget({
    super.key,
    required this.roster,
    required this.indexInList,
  });

  @override
  State<RostersListRowWidget> createState() => _RostersListRowWidgetState();
}

class _RostersListRowWidgetState extends State<RostersListRowWidget> {
  @override
  Widget build(BuildContext context) {
    final model = RosterWidgetModelProvider.watch(context)!.model;
    final roster = widget.roster[widget.indexInList];
    final rosterIndex = model.rosters
        .indexWhere((element) => element == widget.roster[widget.indexInList]);

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
      ),
      onDismissed: (direction) {
        model.deleteRoster(rosterIndex);
      },
      direction: DismissDirection.endToStart,
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(121, 116, 116, 116),
                    offset: Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: 0),
              ],
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            title: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      widget.roster[widget.indexInList].name.length < 27
                          ? widget.roster[widget.indexInList].name.toUpperCase()
                          : widget.roster[widget.indexInList].name
                              .toUpperCase()
                              .substring(0, 27)
                              .padRight(30, '.'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
              const Expanded(child: SizedBox()),
            ]),
          ),
        ),
        onTap: () {
          context.read<RosterCubit>().elements = roster.elements;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RosterEditionScreen(
                elements: roster.elements,
                rosterName: roster.name,
                rosterIndex: widget.indexInList,
              ),
            ),
          );
        },
      ),
    );
  }
}
