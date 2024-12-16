import 'package:flutter/material.dart';

final List homeCare = [
  const _HomeCare(
    skinCare: 'Демакияж',
    imagePath: 'assets/images/4.png',
  ),
  const _HomeCare(
    skinCare: 'Очищение',
    imagePath: 'assets/images/5.png',
  ),
  const _HomeCare(
    skinCare: 'Сыворотка',
    imagePath: 'assets/images/6.png',
  ),
  const _HomeCare(
    skinCare: 'Дневной',
    imagePath: 'assets/images/7.png',
  ),
  const _HomeCare(
    skinCare: 'Ночной',
    imagePath: 'assets/images/7.png',
  ),
  const _HomeCare(
    skinCare: 'Увлажнение',
    imagePath: 'assets/images/5.png',
  ),
];

class _HomeCare extends StatelessWidget {
  const _HomeCare({required this.imagePath, required this.skinCare});

  final String imagePath;
  final String skinCare;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          // fit: BoxFit.cover,
        ),
        Text(
          skinCare,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
