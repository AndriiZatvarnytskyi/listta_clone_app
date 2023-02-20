import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/theme_cubit/theme_cubit.dart';
import 'package:listta_clone_app/view/notes_screen/notes_screen.dart';
import 'package:listta_clone_app/view/tasks_screen/tasks_screen.dart';

class ScreenView extends StatefulWidget {
  const ScreenView({super.key});

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  final PageController _myPage = PageController(initialPage: 0);
  bool isDark = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              context.read<ThemeCubit>().toggleBrightness();
              isDark = !isDark;
              setState(() {});
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/calendar.png',
              height: 20,
              width: 20,
              color: context.read<CalendarBloc>().state.status.isClosed
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            onPressed: () async {
              setState(() {
                context.read<CalendarBloc>().add(
                      CloseCalendar(),
                    );
              });
            },
          ),
          IconButton(
            iconSize: 30.0,
            icon: Image.asset(
              'assets/setting.png',
              height: 20,
              width: 20,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
          )
        ],
        leading: IconButton(
          color: Theme.of(context).iconTheme.color,
          icon: Image.asset(
            'assets/menu.png',
            height: 20,
            width: 20,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {},
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 2,

        // shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Column(
                  children: [
                    IconButton(
                      alignment: Alignment.bottomCenter,
                      icon: const Icon(
                        Icons.done,
                        size: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(0);
                        });
                      },
                    ),
                    Text(
                      'Завдання',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Theme.of(context).primaryColor),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     IconButton(
              //       alignment: Alignment.bottomCenter,
              //       icon: const Icon(
              //         Icons.calendar_month_outlined,
              //         size: 25,
              //       ),
              //       onPressed: () {
              //         setState(() {
              //           _myPage.jumpToPage(1);
              //         });
              //       },
              //     ),
              //     Text(
              //       'Події',
              //       style: Theme.of(context)
              //           .textTheme
              //           .bodyMedium!
              //           .copyWith(color: Theme.of(context).primaryColor),
              //       textAlign: TextAlign.start,
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(right: 45),
                child: Column(
                  children: [
                    IconButton(
                      alignment: Alignment.bottomCenter,
                      icon: const Icon(
                        Icons.note_outlined,
                        size: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(2);
                        });
                      },
                    ),
                    Text(
                      'Замітки',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Theme.of(context).primaryColor),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: PageView(
          controller: _myPage,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            TasksScreen(),
            Center(
              child: Text('Empty Body 2'),
            ),
            NotesScreen()
          ], // Comment this if you need to use Swipe.
        ),
      ),
      // floatingActionButton: SizedBox(
      //   height: 65.0,
      //   width: 65.0,
      //   child: FittedBox(
      //     child: FloatingActionButton(
      //       onPressed: () {},
      //       child: const Icon(
      //         Icons.add,
      //         color: Colors.white,
      //       ),
      //       // elevation: 5.0,
      //     ),
      //   ),
      // ),
    );
  }
}
