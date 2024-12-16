import 'package:flutter/cupertino.dart';

Future<void> skinTypeBottomSheetC(BuildContext context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        title: const Text(
          'Выбор по типу кожи',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
              child: const Text('Жирная'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/oilySkinItems');
              }),
          CupertinoActionSheetAction(
              child: const Text('Комбинированная'), onPressed: () {}),
          CupertinoActionSheetAction(
              child: const Text('Нормальная'), onPressed: () {}),
          CupertinoActionSheetAction(
              child: const Text('Сухая'), onPressed: () {}),
          CupertinoActionSheetAction(
              child: const Text('Любой тип'), onPressed: () {}),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Закрыть'),
          onPressed: () {
            Navigator.pop(context); // Close the modal popup
          },
        ),
      );
    },
  );
}
