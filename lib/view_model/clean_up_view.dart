import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/new_products.dart';

class CleanUpItemsView extends StatelessWidget {
  const CleanUpItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    // newProducts - для примера
    final List<Widget> prodList = newProducts.map((item) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: item,
      );
    }).toList();

    final materGrid = GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2 / 3,
      children: prodList,
    );

    final cupertGrid = SliverGrid.count(
      childAspectRatio: 2 / 3,
      crossAxisCount: 2,
      children: prodList,
    );

    return defaultTargetPlatform == TargetPlatform.android
        ? materGrid
        : defaultTargetPlatform == TargetPlatform.iOS
            ? cupertGrid
            : materGrid;
  }
}
