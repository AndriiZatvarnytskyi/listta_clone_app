import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/roster_cubit/roster_cubit.dart';
import 'package:listta_clone_app/view/roster_screen/widgets/empty_task_widget.dart';
import 'package:listta_clone_app/view_model/roster_view_model.dart';

class RosterElementListRowWidget extends StatefulWidget {
  final int indexInList;
  final int rosterIndex;
  const RosterElementListRowWidget({
    super.key,
    required this.indexInList,
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
    final element = context.read<RosterCubit>().elements[widget.indexInList];
    final icon =
        element.isDone ? Icons.check_box : Icons.check_box_outline_blank;
    final color = element.isDone
        ? Theme.of(context).textTheme.headlineMedium!.color!.withOpacity(0.3)
        : Theme.of(context).textTheme.headlineMedium!.color;

    return BlocBuilder<RosterCubit, RosterState>(
      builder: (context, state) {
        return context.read<RosterCubit>().elements.isNotEmpty
            ? Container(
                //margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(121, 116, 116, 116),
                          offset: Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: 0),
                    ],
                    color: Theme.of(context).appBarTheme.backgroundColor!,
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: IconButton(
                      onPressed: () {
                        element.isDone = !element.isDone;
                        setState(() {});
                      },
                      icon: Icon(
                        icon,
                        color: color,
                      )),
                  title: Text(
                    element.name,
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
              )
            : EmptyTaskWidget();
      },
    );
  }
}
