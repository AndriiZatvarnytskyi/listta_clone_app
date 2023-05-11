import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/theme_cubit/theme_cubit.dart';
import 'package:listta_clone_app/notification/noti.dart';

Widget notificationAddWidget(model, taskIndex, task, context) {
  void notification(int taskIndex, task, TimeOfDay time) {
    NotificationService().showNotification(
        context: context,
        id: taskIndex,
        title: " Не забудь: ${task.text})",
        year: task.date.year,
        month: task.date.month,
        day: task.date.day,
        hour: time.hour,
        minut: time.minute);
  }

  return IconButton(
      icon: const Icon(
        Icons.notification_add,
      ),
      onPressed: () async {
        final TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (context, child) {
            return Theme(
                data: context.read<ThemeCubit>().state.copyWith(
                      timePickerTheme: Theme.of(context).timePickerTheme,
                      textButtonTheme: TextButtonThemeData(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Theme.of(context).hintColor),
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                child: child!);
          },
        );

        if (time == null) {
          return;
        }

        notification(taskIndex, task, time);

        await model.addNotification(
            taskIndex,
            DateTime(task.date.year, task.date.month, task.date.day, time.hour,
                time.minute));
      });
}
