import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String text;
  @HiveField(1)
  bool isDone;
  @HiveField(2)
  DateTime date;
  @HiveField(3)
  DateTime? notificationTime;
  @HiveField(4)
  bool? isHighPriority;
  Task(
      {required this.text,
      required this.isDone,
      required this.date,
      this.notificationTime,
      this.isHighPriority});
}
