import 'package:flutter/material.dart';
import 'package:listta_clone_app/view/notes_screen/notes_screen.dart';
import 'package:listta_clone_app/view/tasks_screen/tasks_screen.dart';

class ScreenView extends StatefulWidget {
  const ScreenView({super.key});

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  final PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 2,

        // shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          .bodyText2!
                          .copyWith(color: Theme.of(context).primaryColor),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    alignment: Alignment.bottomCenter,
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                      size: 25,
                    ),
                    onPressed: () {
                      setState(() {
                        _myPage.jumpToPage(1);
                      });
                    },
                  ),
                  Text(
                    'Події',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
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
                          .bodyText2!
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
      body: PageView(
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
