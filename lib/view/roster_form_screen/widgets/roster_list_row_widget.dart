import 'package:flutter/material.dart';
import 'package:listta_clone_app/view_model/roster_view_model.dart';

class RosterListRowWidget extends StatefulWidget {
  final int indexInList;
  const RosterListRowWidget({
    super.key,
    required this.indexInList,
  });

  @override
  State<RosterListRowWidget> createState() => _RosterListRowWidgetState();
}

class _RosterListRowWidgetState extends State<RosterListRowWidget> {
  @override
  Widget build(BuildContext context) {
    final model = RosterWidgetModelProvider.read(context)!.model;
    final roster = model.rosters[widget.indexInList];

    return Container(
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
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline_outlined),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {});
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor)),
                      child: Text('НІ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white)),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          model.deleteRoster(widget.indexInList);

                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 97, 97, 97))),
                        child: Text('ТАК',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.white)))
                  ],
                  title: Text(
                    'Видалити завдання ${roster.name}?',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 16),
                  ),
                );
              },
            );
          },
        ),
        title: Text(
          roster.name,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.w400),
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
    );
  }
}
