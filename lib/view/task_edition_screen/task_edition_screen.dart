import 'package:flutter/material.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';

class TaskEditionScreen extends StatelessWidget {
  TaskEditionScreen(
      {super.key, required this.taskIndex, required this.taskName});
  final int taskIndex;
  final String taskName;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TasksWidgetModelProvider(
      model: TasksWidgetModel(),
      child: Builder(builder: (context) {
        final model = TasksWidgetModelProvider.read(context)!.model;
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    TasksWidgetModelProvider.read(context)!
                        .model
                        .deleteTask(taskIndex);
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
              'Завдання',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                  initialValue: taskName,
                  style: Theme.of(context).textTheme.headlineMedium,
                  autofocus: true,
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
                  onChanged: (value) => controller.text = value,
                  onEditingComplete: () {
                    model.nameChange(taskIndex, controller.text);
                    Navigator.pop(context);
                  })),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.nameChange(taskIndex, controller.text);
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
