// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:listta_clone_app/blocs/bloc/sliding_settings_bloc.dart';
// import 'package:listta_clone_app/blocs/task_cubit/task_cubit.dart';
// import 'package:listta_clone_app/view/tasks_screen/widgets/sliding_list_row_widget.dart';
// import 'package:listta_clone_app/view/tasks_screen/widgets/sliding_list_widget.dart';
// import 'package:listta_clone_app/view/tasks_screen/widgets/task_list_row_widget.dart';
// import 'package:listta_clone_app/view/tasks_screen/widgets/task_list_widget.dart';
// import 'package:listta_clone_app/view_model/tasks_view_model.dart';
// import 'package:listta_clone_app/widgets/sliding_up_widget.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

// class TextScreen extends StatefulWidget {
//   const TextScreen({super.key});

//   @override
//   State<TextScreen> createState() => _TextScreenState();
// }

// class _TextScreenState extends State<TextScreen> {
//   final PanelController panelController = PanelController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SlidingSettingsBloc, SlidingSettingsState>(
//       builder: (context, state) {
//         return Scaffold(
//             body: TasksWidgetModelProvider(
//           model: TasksWidgetModel(),
//           child: Builder(builder: (context) {
//             final model = TasksWidgetModelProvider.watch(context)!.model;

//             final task =
//                 model.tasks.where((element) => element.date.day == 6).toList();
//             return Stack(
//               children: [
//                 Center(
//                     child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         BlocProvider.of<SlidingSettingsBloc>(context)
//                             .add(OpenSettings(
//                           index: 2,
//                         ));
//                         //BlocProvider.of<TaskCubit>(context).changeIndex(2);
//                         panelController.open();
//                         setState(() {});
//                       },
//                       child: Container(
//                         width: 100,
//                         height: 100,
//                         color: Colors.blueAccent,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         //BlocProvider.of<TaskCubit>(context).changeIndex(5);
//                         BlocProvider.of<SlidingSettingsBloc>(context)
//                             .add(OpenSettings(
//                           index: 5,
//                         ));
//                         panelController.open();
//                         setState(() {});
//                       },
//                       child: Container(
//                         width: 100,
//                         height: 100,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ],
//                 )),
//                 slidingUpWidget(
//                   panelHeightOpen: MediaQuery.of(context).size.height *
//                     context: context,
//                     panelController: panelController,
//                     children: [const SlidingListWidget()])
//               ],
//             );
//           }),
//         ));
//       },
//     );
//   }
// }
