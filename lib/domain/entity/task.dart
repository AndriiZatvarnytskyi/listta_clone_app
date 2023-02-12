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
  Task({
    required this.text,
    required this.isDone,
    required this.date,
  });
}