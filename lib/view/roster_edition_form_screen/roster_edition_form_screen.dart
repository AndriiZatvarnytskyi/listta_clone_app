import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/note_cubit/note_cubit.dart';
import 'package:listta_clone_app/blocs/roster_cubit/roster_cubit.dart';
import 'package:listta_clone_app/view/roster_edition_form_screen/widgets/roster_elements_widget.dart';

import '../../domain/entity/roster_element.dart';

// ignore: must_be_immutable
class RosterEditionScreen extends StatefulWidget {
  RosterEditionScreen(
      {super.key,
      required this.rosterIndex,
      required this.rosterName,
      required this.elements});
  final int rosterIndex;
  String rosterName;
  List<RosterElement> elements;

  @override
  State<RosterEditionScreen> createState() => _RosterEditionScreenState();
}

class _RosterEditionScreenState extends State<RosterEditionScreen> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<RosterCubit>().rosterChange(
                      rosterIndex: widget.rosterIndex,
                      name: widget.rosterName,
                      //elements: widget.elements,
                    );
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done)),
          IconButton(
              onPressed: () {
                context.read<RosterCubit>().deleteRoster(widget.rosterIndex);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete_outline))
        ],
        leading: Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: IconButton(
            icon: const Icon(
              Icons.close,
              size: 22,
            ),
            onPressed: () {
              context.read<RosterCubit>().elements = [];
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'Список',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                    initialValue: widget.rosterName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 27),
                    autofocus: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Назва',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).hintColor,
                              fontSize: 27),
                    ),
                    onChanged: (value) => widget.rosterName = value,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                      //Navigator.pop(context);
                    }),
                RosterElementsWidget(
                    rosterIndex: widget.rosterIndex, elements: widget.elements),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 18),
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Назва завдання',
                    hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).hintColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  onChanged: (value) =>
                      context.read<RosterCubit>().rosterElementName = value,
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {});
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 97, 97, 97))),
                    child: Text('НІ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.white)),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<RosterCubit>().addElement();
                        context.read<RosterCubit>().rosterChange(
                              rosterIndex: widget.rosterIndex,
                              name: widget.rosterName,
                              //elements: widget.elements,
                            );

                        Navigator.pop(context);
                        FocusScope.of(context).unfocus();
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Text('ТАК',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white)))
                ],
                title: Text(
                  'Додати завдання?',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 16),
                ),
              );
            },
          );
        },
        // NoteFormWidgetModelProvider.read(context)?.model.saveNote(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
