import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listta_clone_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:listta_clone_app/blocs/theme_cubit/theme_cubit.dart';
import 'package:listta_clone_app/view/notes_screen/notes_screen.dart';
import 'package:listta_clone_app/view/tasks_screen/tasks_screen.dart';
import 'package:listta_clone_app/widgets/theme_list.dart';

class ScreenView extends StatefulWidget {
  const ScreenView({super.key});

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  final PageController _myPage = PageController(initialPage: 0);
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _myPage.addListener(() {
      setState(() {
        _currentPage = _myPage.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Image.asset(
                'assets/calendar.png',
                height: 20,
                width: 20,
                color: context.read<CalendarBloc>().state.status.isClosed
                    ? Theme.of(context).iconTheme.color
                    : Theme.of(context).primaryColor,
              ),
              onPressed: () async {
                setState(() {
                  context.read<CalendarBloc>().add(
                        CloseCalendar(),
                      );
                });
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.color,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Обери \nулюблену тему'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontSize: 32, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )),
            const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: ThemeList(),
              ),
            )
          ],
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
                      icon: Icon(
                        Icons.done,
                        size: 25,
                        color: _currentPage == 0
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).iconTheme.color,
                      ),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(0);
                        });
                      },
                    ),
                    Text(
                      'Завдання',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: _currentPage == 0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).iconTheme.color),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     IconButton(
              //       alignment: Alignment.bottomCenter,
              //       icon:  Icon(
              //         Icons.calendar_month_outlined,
              //         size: 25,
              //color: _myPage.page == 1 ? Theme.of(context).primaryColor : Theme.of(context).disabledColor
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
              //           .copyWith(color: _myPage.page == 1 ? Theme.of(context).primaryColor : Theme.of(context).disabledColor),
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
                      icon: Icon(
                        Icons.note_outlined,
                        size: 25,
                        color: _currentPage == 1
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).iconTheme.color,
                      ),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(1);
                        });
                      },
                    ),
                    Text(
                      'Замітки',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: _currentPage == 1
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).iconTheme.color,
                          ),
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
