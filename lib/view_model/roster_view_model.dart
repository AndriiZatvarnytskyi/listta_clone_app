import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:listta_clone_app/view/roster_form_screen/roster_form_screen.dart';
import '../domain/data_provider/box_manager.dart';
import '../domain/entity/roster.dart';
import '../domain/entity/roster_element.dart';

class RosterWidgetModel extends ChangeNotifier {
  late final Future<Box<Roster>> _box;
  ValueListenable<Object>? _listenableBox;
  var _rosters = <Roster>[];

  List<Roster> get rosters => _rosters.toList();

  RosterWidgetModel() {
    _setup();
  }

  // void showForm(BuildContext context, DateTime selectedDay) {
  //   Navigator.of(context)
  //       .pushNamed(MainNavigationRouteNames.addTask, arguments: selectedDay);
  // }
  void saveRoster(
    BuildContext context,
    String rosterName,
    List<RosterElement> elements,
  ) async {
    final box = await BoxManager.instance.openRosterBox();
    final roster = Roster(elements: elements, name: rosterName);
    await box.add(roster);
    await BoxManager.instance.closeBox(box);
  }

  void showForm(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RosterFormScreen()));
  }

  // Future<void> showTasks(BuildContext context, int groupIndex) async {
  //   final group = (await _box).getAt(groupIndex);
  //   if (group != null) {
  //     final configuration = TasksWidgetConfiguration(
  //         groupKey: group.key as int, title: group.name);

  //     Navigator.of(context)
  //         .pushNamed(MainNavigationRouteNames.tasks, arguments: configuration);
  //   }
  // }

  Future<void> deleteRoster(int rosterIndex) async {
    final box = (await _box);
    final rosterKey = (await _box).keyAt(rosterIndex);
    final rosterBoxName = BoxManager.instance.makeTaskBoxName(rosterKey);
    await Hive.deleteBoxFromDisk(rosterBoxName);
    await box.deleteAt(rosterIndex);
  }

  Future<void> _readRostersFromHive() async {
    _rosters = (await _box).values.toList();
    notifyListeners();
  }

  Future<void> _setup() async {
    _box = BoxManager.instance.openRosterBox();
    await _readRostersFromHive();
    _listenableBox = (await _box).listenable();
    _listenableBox?.addListener(_readRostersFromHive);
  }

  Future<void> nameChange(int rosterIndex, String text) async {
    final roster = (await _box).getAt(rosterIndex);
    roster?.name = text;
    await roster?.save();
  }

  @override
  Future<void> dispose() async {
    _listenableBox?.removeListener(_readRostersFromHive);
    await BoxManager.instance.closeBox((await _box));
    super.dispose();
  }
}

class RosterWidgetModelProvider extends InheritedNotifier {
  final RosterWidgetModel model;
  const RosterWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static RosterWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<RosterWidgetModelProvider>();
  }

  static RosterWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<RosterWidgetModelProvider>()
        ?.widget;
    return widget is RosterWidgetModelProvider ? widget : null;
  }
}
