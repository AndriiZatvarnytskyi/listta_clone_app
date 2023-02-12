import 'package:flutter/material.dart';
import 'package:listta_clone_app/view_model/task_form_view_model.dart';
import 'package:listta_clone_app/view/task_form_screen/widgets/task_form_widget.dart';

class TaskFormScreen extends StatelessWidget {
  final selectedDays;
  TaskFormScreen({super.key, required this.selectedDays});

  final _model = TaskFormWidgetModel();

  // final dsdas =

  @override
  Widget build(BuildContext context) {
    return TaskFormWidgetModelProvider(
      model: _model,
      child: _TaskFormScreenBody(
        selectedDays: selectedDays,
      ),
    );
  }
}

class _TaskFormScreenBody extends StatelessWidget {
  var selectedDays;

  _TaskFormScreenBody({required this.selectedDays});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'Створити завдання $selectedDays',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TaskFormWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            TaskFormWidgetModelProvider.read(context)?.model.saveTask(context),
        child: const Icon(Icons.done),
      ),
    );
  }
}
