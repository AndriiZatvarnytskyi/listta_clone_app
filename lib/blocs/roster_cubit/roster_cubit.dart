import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:listta_clone_app/domain/data_provider/box_manager.dart';
import 'package:listta_clone_app/domain/entity/roster.dart';
import 'package:listta_clone_app/domain/entity/roster_element.dart';

part 'roster_state.dart';

class RosterCubit extends Cubit<RosterState> {
  RosterCubit() : super(RosterInitial());

  dynamic rosterName;
  dynamic rosterElementName;
  List<RosterElement> elements = [];

  Future<void> deleteRoster(
    int rosterIndex,
  ) async {
    final box = await BoxManager.instance.openRosterBox();
    final roster = (box).getAt(rosterIndex);
    roster!.delete();
    rosterName = '';
    rosterElementName = '';
    elements = [];
  }

  Future<void> deleteElement(bool isDone, String name) async {
    elements.remove(RosterElement(isDone: isDone, name: name));
    elements.removeAt(1);

    rosterElementName = '';
  }

  void addElement() async {
    if (rosterElementName.isEmpty) return;
    elements.add(RosterElement(name: rosterElementName, isDone: false));
    rosterElementName = '';
  }

  Future<void> rosterChange({
    required int rosterIndex,
    required String name,
  }) async {
    final box = await BoxManager.instance.openRosterBox();
    final roster = (box).getAt(rosterIndex);
    if (name.isEmpty) {
      if (elements.first.name.isNotEmpty) {
        roster!.name = elements.first.name;

        await roster.save();
      } else {
        await roster!.delete();
      }
    } else {
      roster?.elements = elements;
      await roster?.save();
      roster?.name = name;
      await roster?.save();
    }
  }

  void saveRoster() async {
    if (rosterName.isEmpty && elements.isEmpty) {
      return;
    } else if (rosterName.isEmpty && elements.isNotEmpty) {
      rosterName = elements.first.name;

      final box = await BoxManager.instance.openRosterBox();
      final roster = Roster(
        elements: elements,
        name: rosterName,
      );
      await box.add(roster);
      await BoxManager.instance.closeBox(box);
      rosterName = '';
      elements = [];
    } else {
      final box = await BoxManager.instance.openRosterBox();
      final Roster roster = Roster(
        elements: elements,
        name: rosterName,
      );
      await box.add(roster);
      await BoxManager.instance.closeBox(box);
      rosterName = '';
      elements = [];
    }
  }
}
