import 'package:flutter/material.dart';

final List<Widget> newProducts = [
  const _NewProduct(
    productType: 'Сыворотка',
    productTitle: 'Unstress Total\nSerenity Serum',
    productPrice: '10 195 ₽',
    imagePath: 'assets/images/1.png',
  ),
  const _NewProduct(
    productType: 'Тоник',
    productTitle: 'Unstress Revitalizing\nToner',
    productPrice: '3 095 ₽',
    imagePath: 'assets/images/2.png',
  ),
  const _NewProduct(
    productType: 'Сыворотка',
    productTitle: 'Unstress Total\nSerenity Serum',
    productPrice: '10 195 ₽',
    imagePath: 'assets/images/1.png',
  ),
  const _NewProduct(
    productType: 'Тоник',
    productTitle: 'Unstress Revitalizing\nToner',
    productPrice: '3 095 ₽',
    imagePath: 'assets/images/2.png',
  ),
];

class _NewProduct extends StatelessWidget {
  const _NewProduct(
      {required this.imagePath,
      required this.productTitle,
      required this.productType,
      required this.productPrice});

  final String imagePath;
  final String productType;
  final String productTitle;
  final String productPrice;

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
        Text(
          productPrice,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
