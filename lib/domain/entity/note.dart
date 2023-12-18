import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 2)
class Note extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String description;

  Note({
    required this.name,
    required this.description,
  });
}
