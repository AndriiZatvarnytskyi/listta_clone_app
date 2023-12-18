import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/roster_screen/widgets/roster_list_widget.dart';
import 'package:listta_clone_app/view_model/roster_view_model.dart';
import 'package:listta_clone_app/view_model/tasks_view_model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({
    super.key,
  });

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return RosterWidgetModelProvider(
      model: RosterWidgetModel(),
      child: Builder(builder: (context) {
        return Scaffold(
          extendBody: true,
          body: RostersListWidget(),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 12),
            child: FloatingActionButton(
              onPressed: () {
                RosterWidgetModelProvider.read(context)?.model.showForm(
                      context,
                    );
              },
              child: const Icon(Icons.add),
            ),
          ),
        );
      }),
    );
  }
}
