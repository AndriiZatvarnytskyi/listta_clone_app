import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/note_cubit/note_cubit.dart';

// ignore: must_be_immutable
class NoteEditionScreen extends StatelessWidget {
  NoteEditionScreen(
      {super.key,
      required this.noteIndex,
      required this.noteName,
      required this.noteDescription});
  final int noteIndex;
  String noteName;
  String noteDescription;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                          ),
                          child: Text(
                            'НІ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              context.read<NoteCubit>().deleteNote(noteIndex);
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 151, 58, 57))),
                            child: Text('ТАК',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: Colors.white)))
                      ],
                      title: Text(
                        'Видалити завдання $noteName?',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 16),
                      ),
                    );
                  },
                );
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
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'Нотатка',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                    initialValue: noteName,
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
                    onChanged: (value) => noteName = value,
                    onEditingComplete: () {
                      context.read<NoteCubit>().noteChange(
                          noteIndex: noteIndex,
                          name: noteName,
                          description: noteDescription);

                      Navigator.pop(context);
                    }),
                Container(
                  height: 1.5,
                  width: double.infinity,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                ),
                TextFormField(
                    initialValue: noteDescription,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 50,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 18),
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Опис',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(
                              color: Theme.of(context).hintColor, fontSize: 18),
                    ),
                    onChanged: (value) => noteDescription = value,
                    onEditingComplete: () {
                      context.read<NoteCubit>().noteChange(
                          noteIndex: noteIndex,
                          name: noteName,
                          description: noteDescription);

                      Navigator.pop(context);
                    }),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<NoteCubit>().noteChange(
              noteIndex: noteIndex,
              name: noteName,
              description: noteDescription);

          Navigator.pop(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
