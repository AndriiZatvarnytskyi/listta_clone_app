import 'package:flutter/material.dart';
import 'package:listta_clone_app/view_model/note_view_model.dart';

class NoteEditionScreen extends StatelessWidget {
  NoteEditionScreen(
      {super.key,
      required this.noteIndex,
      required this.noteName,
      required this.noteDescription});
  final int noteIndex;
  final String noteName;
  final String noteDescription;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NotesWidgetModelProvider(
      model: NotesWidgetModel(),
      child: Builder(builder: (context) {
        final model = NotesWidgetModelProvider.read(context)!.model;
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    NotesWidgetModelProvider.read(context)!
                        .model
                        .deleteNote(noteIndex);
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
              child: Column(
                children: [
                  TextFormField(
                      initialValue: noteName,
                      style: Theme.of(context).textTheme.headlineMedium,
                      autofocus: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Назва',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).hintColor),
                      ),
                      onChanged: (value) => nameController.text = value,
                      onEditingComplete: () {
                        model.nameChange(noteIndex, nameController.text);
                        Navigator.pop(context);
                      }),
                  TextFormField(
                      initialValue: noteDescription,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 20,
                      style: Theme.of(context).textTheme.headlineMedium,
                      autofocus: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Опис',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      onChanged: (value) => descriptionController.text = value,
                      onEditingComplete: () {
                        model.nameChange(noteIndex, nameController.text);
                        model.descriptionChange(
                            noteIndex, descriptionController.text);
                        Navigator.pop(context);
                      }),
                ],
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.descriptionChange(noteIndex, descriptionController.text);
              Navigator.pop(context);
            },
            // NoteFormWidgetModelProvider.read(context)?.model.saveNote(context),
            child: const Icon(Icons.done),
          ),
        );
      }),
    );
  }
}
