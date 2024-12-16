import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPickerButton extends StatefulWidget {
  const MenuPickerButton({
    super.key,
    required this.initIndex,
    required this.itemsList,
    required this.title,
  });

  final String title;
  final int initIndex;
  final List<String> itemsList;

  @override
  State<MenuPickerButton> createState() => _MenuPickerButtonState();
}

class _MenuPickerButtonState extends State<MenuPickerButton> {
  int? _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.initIndex;
    super.initState();
  }

  void _dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(widget.title),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: SizedBox(
                  height: 80,
                  child: CupertinoPicker(
                    itemExtent: 33,
                    scrollController: FixedExtentScrollController(
                      initialItem: _selectedIndex!,
                    ),
                    onSelectedItemChanged: (int index) => setState(() {
                      _selectedIndex = index;
                    }),
                    children: List<Widget>.generate(
                      widget.itemsList.length,
                      (int index) => Text(widget.itemsList[index]),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(widget.itemsList[_selectedIndex!]),
      onPressed: () => _dialog(context),
    );
  }
}
