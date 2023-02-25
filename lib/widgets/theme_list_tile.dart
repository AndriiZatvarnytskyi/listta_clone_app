import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ThemeListTile extends StatelessWidget {
  ThemeListTile(
      {super.key,
      required this.firstColor,
      required this.secondColor,
      required this.onTap});
  Color? firstColor;
  Color? secondColor;
  void Function() onTap;

  @override
  Widget build(
    BuildContext context,
  ) {
    const double boxH = 50;
    const double boxW = 100;
    return Padding(
      padding: const EdgeInsets.only(bottom: boxH * .5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(
                    Theme.of(context).hintColor.withOpacity(0.2)),
                elevation: MaterialStateProperty.all(20),
              ),
              onPressed: onTap,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: firstColor,
                    ),
                    width: boxW,
                    height: boxH,
                  ),
                  Container(
                    width: boxW,
                    height: boxH,
                    color: secondColor,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
