import 'package:flutter/material.dart';

Future<void> skinTypeBottomSheetM(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  BackButton(onPressed: () => Navigator.pop(context)),
                  const Spacer(),
                  const Text(
                    'Выбор по типу кожи',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            _sheetItem('Жирная', () {
              Navigator.of(context).pushReplacementNamed('/oilySkinItems');
            }),
            _sheetItem('Комбинированная', () {}),
            _sheetItem('Нормальная', () {}),
            _sheetItem('Сухая', () {}),
            _sheetItem('Любой тип', () {}),
          ],
        ),
      );
    },
  );
}

Widget _sheetItem(String text, void Function() action) => TextButton(
      onPressed: action,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
