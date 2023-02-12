import 'package:flutter/material.dart';
import 'package:listta_clone_app/view_model/task_form_view_model.dart';

class TaskFormWidget extends StatelessWidget {
  const TaskFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = TaskFormWidgetModelProvider.read(context)?.model;
    return TextField(
      style: Theme.of(context).textTheme.headline4,
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Назва',
        hintStyle: Theme.of(context).textTheme.headline3!.copyWith(
            fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),
      ),
      onChanged: (value) => model?.taskName = value,
      onEditingComplete: () => model?.saveTask(context),
    );
  }
}
