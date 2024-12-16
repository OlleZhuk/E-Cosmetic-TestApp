import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/action_products.dart';

class RegenerationItemsView extends StatelessWidget {
  const RegenerationItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    // actionProducts - для примера
    final List<Widget> prodList = actionProducts.map((item) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
