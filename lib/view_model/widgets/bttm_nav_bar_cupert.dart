import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/nav_tabs.dart';

Widget bottmNavBarCupertino(
  int selectedPageIndex,
  void Function(int) selectPage,
  Widget child,
) =>
    CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        border: const Border(top: BorderSide(color: Colors.grey)),
        items: bottmNavTabs,
      ),
      tabBuilder: (BuildContext context, index) => Center(child: child),
    );
