import 'package:flutter/material.dart';

class UserProgresWidget extends StatefulWidget {
  const UserProgresWidget({super.key});

  @override
  State<UserProgresWidget> createState() => _UserProgresWidgetState();
}

class _UserProgresWidgetState extends State<UserProgresWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Icon(Icons.person),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Прогрес сьогодні(0/1)',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
