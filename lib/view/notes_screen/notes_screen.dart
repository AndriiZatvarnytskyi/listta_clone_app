import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/notes_screen/widgets/notes_widget.dart';
import 'package:listta_clone_app/view/task_form_screen/task_form_screen.dart';
import 'package:listta_clone_app/view/calendar_table_widget.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/user_progres_widget.dart';
import 'package:listta_clone_app/view_model/calendar_view_model.dart';
import 'package:listta_clone_app/view_model/note_view_model.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';
import 'package:listta_clone_app/view/tasks_screen/widgets/tasks_widget.dart';

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
          appBar: AppBar(
            actions: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.search,
                  size: 25,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                  'assets/calendar.png',
                  height: 20,
                  width: 20,
                ),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30.0,
                icon: Image.asset(
                  'assets/setting.png',
                  height: 20,
                  width: 20,
                ),
                onPressed: () {},
              )
            ],
            leading: IconButton(
              icon: Image.asset(
                'assets/menu.png',
                height: 20,
                width: 20,
              ),
              onPressed: () {},
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              NotesWidgetModelProvider.read(context)?.model.showForm(context);
            },
            child: const Icon(Icons.add),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(child: NotesWidget()),
              ],
            ),
          ),
        );
      }),
    );
  }
}
