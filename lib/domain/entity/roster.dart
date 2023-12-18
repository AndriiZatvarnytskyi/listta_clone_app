import 'package:hive/hive.dart';
import 'package:listta_clone_app/domain/entity/roster_element.dart';

part 'roster.g.dart';

@HiveType(typeId: 3)
class Roster extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<RosterElement> elements;

  Roster({
    required this.elements,
    required this.name,
  });
}
