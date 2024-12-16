import 'package:flutter/material.dart';

Widget actionButton(
  String buttonText,
  Color buttonColor,
  Color textColor,
  Color sideColor,
  void Function() action,
) =>
    TextButton(
      onPressed: action,
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: sideColor, width: 1),
          // radius 8 - like CupertinoButton has
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
        ),
      ),
    );
