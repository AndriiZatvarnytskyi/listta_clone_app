import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/notes_screen/widgets/notes_widget.dart';
import 'package:listta_clone_app/view_model/note_view_model.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({
    super.key,
  });

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return NotesWidgetModelProvider(
      model: NotesWidgetModel(),
      child: Builder(builder: (context) {
        return Scaffold(
          extendBody: true,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 12),
            child: FloatingActionButton(
              onPressed: () {
                NotesWidgetModelProvider.read(context)?.model.showForm(context);
              },
              child: const Icon(Icons.add),
            ),
          ),
          body: Column(
            children: [
              Expanded(child: NotesWidget()),
            ],
          ),
        );
      }),
    );
  }
}
