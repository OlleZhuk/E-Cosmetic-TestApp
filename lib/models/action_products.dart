import 'package:flutter/material.dart';

final List<Widget> actionProducts = [
  const _ActionProduct(
    productType: 'Сыворотка',
    productTitle: 'Muse Serum\nSupreme',
    productPrice: '10 195 ₽  ',
    oldProductPrice: '11 195 ₽',
    imagePath: 'assets/images/8.png',
  ),
  const _ActionProduct(
    productType: 'Крем',
    productTitle: 'Unstress Revitalizing\nToner',
    productPrice: '1 595 ₽  ',
    oldProductPrice: '3 095 ₽',
    imagePath: 'assets/images/9.png',
  ),
  const _ActionProduct(
    productType: 'Сыворотка',
    productTitle: 'Muse Serum\nSupreme',
    productPrice: '10 195 ₽  ',
    oldProductPrice: '11 195 ₽',
    imagePath: 'assets/images/8.png',
  ),
  const _ActionProduct(
    productType: 'Крем',
    productTitle: 'Unstress Revitalizing\nToner',
    productPrice: '1 595 ₽  ',
    oldProductPrice: '3 095 ₽',
    imagePath: 'assets/images/9.png',
  ),
];

class _ActionProduct extends StatelessWidget {
  const _ActionProduct(
      {required this.imagePath,
      required this.productTitle,
      required this.productType,
      required this.productPrice,
      required this.oldProductPrice});

  final String imagePath;
  final String productType;
  final String productTitle;
  final String productPrice;
  final String oldProductPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        Text(
          productType,
          style: const TextStyle(fontSize: 12),
        ),
        Text(
          productTitle,
          style: const TextStyle(fontSize: 14),
        ),
        Row(
          children: [
            Text(
              productPrice,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              oldProductPrice,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
