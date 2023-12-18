import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

Widget slidingUpWidget(
    {required BuildContext context,
    required PanelController panelController,
    required double panelHeightOpen,
    required List<Widget> children}) {
  Widget panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: children,
        ));
  }

  //panelHeightOpen = MediaQuery.of(context).size.height * .50;

  double panelHeightClosed = 0.0;
  return SlidingUpPanel(
    color: Theme.of(context).appBarTheme.backgroundColor!,
    controller: panelController,
    maxHeight: panelHeightOpen,
    minHeight: panelHeightClosed,
    panelBuilder: (sc) => panel(sc),
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
  );
}
