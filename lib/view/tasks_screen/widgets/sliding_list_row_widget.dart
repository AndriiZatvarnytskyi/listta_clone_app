import 'package:flutter/material.dart';

class TaskSettingsListRowWiget extends StatelessWidget {
  TaskSettingsListRowWiget(
      {super.key,
      required this.icon,
      required this.title,
      this.newColor,
      required this.onTap});
  final IconData? icon;
  final String? title;
  final Color? newColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).textTheme.headlineMedium!.color;
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: InkWell(
        onTap: onTap,
        child: Row(children: [
          Icon(
            icon,
            color: newColor ?? color,
            size: 24,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title as String,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: newColor ?? color, fontSize: 18),
          ),
        ]),
      ),
    );
  }
}
