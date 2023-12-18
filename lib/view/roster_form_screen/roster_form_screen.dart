import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/roster_cubit/roster_cubit.dart';
import 'package:listta_clone_app/view/roster_form_screen/widgets/roster_elements_widget.dart';

import '../../domain/entity/roster_element.dart';
import 'widgets/roster_name_form_widget.dart';

class RosterFormScreen extends StatefulWidget {
  RosterFormScreen({super.key});

  @override
  State<RosterFormScreen> createState() => _RosterFormScreenState();
}

class _RosterFormScreenState extends State<RosterFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<RosterCubit>().saveRoster();
                Navigator.pop(context);
              },
              icon: Icon(Icons.done))
        ],
        leading: Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: IconButton(
            icon: const Icon(
              Icons.close,
              size: 22,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              context.read<RosterCubit>().elements = [];
            },
          ),
        ),
        title: Text(
          'Новий список',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const RosterNameFormWidget(),
              RosterElementsWidget(),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
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
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
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
                            Color.fromARGB(255, 97, 97, 97))),
                    child: Text('НІ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.white)),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<RosterCubit>().addElement();
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
