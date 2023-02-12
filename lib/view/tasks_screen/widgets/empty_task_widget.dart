import 'package:flutter/material.dart';

class EmptyTaskWidget extends StatelessWidget {
  const EmptyTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          children: [
            Text(
              'Ваш список порожній',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Натисність "+", щоб створити завдання',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}