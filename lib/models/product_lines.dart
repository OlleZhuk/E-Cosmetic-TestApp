import 'package:flutter/material.dart';

final List cosmLines = [
  const _CosmeticLine(
    lineTitle: 'Наборы',
    imagePath: 'assets/images/hl02.png',
  ),
  const _CosmeticLine(
    lineTitle: 'Для лица',
    imagePath: 'assets/images/hl03.png',
  ),
  const _CosmeticLine(
    lineTitle: 'Для глаз',
    imagePath: 'assets/images/hl04.png',
  ),
  const _CosmeticLine(
    lineTitle: 'Для тела',
    imagePath: 'assets/images/hl05.png',
  ),
  const _CosmeticLine(
    lineTitle: 'Умывание',
    imagePath: 'assets/images/hl06.png',
  ),
];

class _CosmeticLine extends StatelessWidget {
  const _CosmeticLine({required this.imagePath, required this.lineTitle});

  final String imagePath;
  final String lineTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        Text(
          lineTitle,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
