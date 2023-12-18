import 'package:hive/hive.dart';

part 'roster_element.g.dart';

@HiveType(typeId: 4)
class RosterElement extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  bool isDone;

  RosterElement({
    required this.name,
    required this.isDone,
  });
}
