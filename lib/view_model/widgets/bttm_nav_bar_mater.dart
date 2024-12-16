import 'package:flutter/material.dart';

import '../../models/nav_tabs.dart';

Widget bottmNavBarMaterial(
  int selectedPageIndex,
  void Function(int) selectPage,
) =>
    Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: BottomNavigationBar(
        iconSize: 30,
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: bottmNavTabs,
      ),
    );
