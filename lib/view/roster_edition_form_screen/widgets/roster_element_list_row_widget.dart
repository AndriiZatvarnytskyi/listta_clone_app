import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/roster_cubit/roster_cubit.dart';
import 'package:listta_clone_app/domain/entity/roster_element.dart';
import 'package:listta_clone_app/view/roster_screen/widgets/empty_task_widget.dart';
import 'package:listta_clone_app/view_model/roster_view_model.dart';

class RosterElementListRowWidget extends StatefulWidget {
  final int indexInList;
  final int rosterIndex;
  List<RosterElement> elements;
  RosterElementListRowWidget({
    super.key,
    required this.indexInList,
    required this.elements,
    required this.rosterIndex,
  });

  @override
  State<RosterElementListRowWidget> createState() =>
      _RosterElementListRowWidgetState();
}

class _RosterElementListRowWidgetState
    extends State<RosterElementListRowWidget> {
  @override
  Widget build(BuildContext context) {
    final model = RosterWidgetModelProvider.read(context)!.model;
    IconData icon =
        widget.elements.isNotEmpty && widget.elements[widget.indexInList].isDone
            ? Icons.check_box
            : Icons.check_box_outline_blank;
    Color? color = widget.elements.isNotEmpty &&
            widget.elements[widget.indexInList].isDone
        ? Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(0.3)
        : Theme.of(context).textTheme.headlineMedium!.color;

    int index = widget.elements.indexOf(RosterElement(
        isDone: widget.elements[widget.indexInList].isDone,
        name: widget.elements[widget.indexInList].name));
    //final element = model.rosters[widget.rosterIndex].elements;

    return BlocBuilder<RosterCubit, RosterState>(
      builder: (context, state) {
        return
            // Dismissible(
            // key: UniqueKey(),
            //background: Container(
            //  alignment: AlignmentDirectional.centerEnd,
            // ),
            // onDismissed: (direction) {
            //  context.read<RosterCubit>().deleteElement(
            //      widget.elements[widget.indexInList].isDone,
            //      widget.elements[widget.indexInList].name);
            //   setState(() {});
            //  print(widget.elements);
            //},
            //direction: DismissDirection.endToStart,
            //child:
            Container(
          margin: const EdgeInsets.symmetric(horizontal: 0),
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
            leading: IconButton(
              onPressed: () {
                context
                        .read<RosterCubit>()
                        .elements[widget.indexInList]
                        .isDone =
                    !context
                        .read<RosterCubit>()
                        .elements[widget.indexInList]
                        .isDone;
                setState(() {});
              },
              icon: Icon(
                icon,
                color: color,
              ),
            ),
            title: Text(
              widget.elements[widget.indexInList].name,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.w400, color: color),
            ),
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => RosterEditionScreen(
              //       noteDescription: roster.description.toString(),
              //       noteName: roster.name,
              //       noteIndex: widget.indexInList,
              //     ),
              //   ),
              // );
            },
          ),
          // ),
        );
      },
    );
  }
}
