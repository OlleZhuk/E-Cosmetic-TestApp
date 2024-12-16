import 'package:flutter/material.dart';

class ProductsCarousel extends StatelessWidget {
  const ProductsCarousel({super.key, required this.itemList});

  final List<Widget> itemList;

  @override
  Widget build(BuildContext context) {
    final devWidth = MediaQuery.sizeOf(context).width;

    return SizedBox(
      width: devWidth,
      height: devWidth * .68,
      child: CarouselView(
        itemExtent: devWidth * .4,
        shrinkExtent: 150,
        children: itemList,
      ),
    );
  }
}
