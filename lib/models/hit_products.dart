import 'package:flutter/material.dart';

final List<Widget> hitProducts = [
  const _HitProduct(
    productType: 'Сыворотка',
    productTitle: 'Forever Young - Total\nRenewal Serum',
    productPrice: '10 195 ₽',
    imagePath: 'assets/images/10.png',
  ),
  const _HitProduct(
    productType: 'Осветляющая маска',
    productTitle: 'Illustious Mask',
    productPrice: '3 095 ₽',
    imagePath: 'assets/images/11.png',
  ),
  const _HitProduct(
    productType: 'Сыворотка',
    productTitle: 'Forever Young - Total\nRenewal Serum',
    productPrice: '10 195 ₽',
    imagePath: 'assets/images/10.png',
  ),
  const _HitProduct(
    productType: 'Осветляющая маска',
    productTitle: 'Illustious Mask',
    productPrice: '3 095 ₽',
    imagePath: 'assets/images/11.png',
  ),
  const _HitProduct(
    productType: 'Сыворотка',
    productTitle: 'Forever Young - Total\nRenewal Serum',
    productPrice: '10 195 ₽',
    imagePath: 'assets/images/10.png',
  ),
  const _HitProduct(
    productType: 'Осветляющая маска',
    productTitle: 'Illustious Mask',
    productPrice: '3 095 ₽',
    imagePath: 'assets/images/11.png',
  ),
];

class _HitProduct extends StatelessWidget {
  const _HitProduct(
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
