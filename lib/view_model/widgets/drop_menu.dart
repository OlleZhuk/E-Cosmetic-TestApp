import 'package:flutter/material.dart';

class FiltersDropMenu extends StatefulWidget {
  const FiltersDropMenu(
      {super.key, required this.dropdownValue, required this.itemsList});

  final String dropdownValue;
  final List<String> itemsList;

  @override
  State<FiltersDropMenu> createState() => _FiltersDropMenuState();
}

class _FiltersDropMenuState extends State<FiltersDropMenu> {
  String? value;

  @override
  void initState() {
    value = widget.dropdownValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      iconSize: 0.0,
      alignment: AlignmentDirectional.centerEnd,
      items: widget.itemsList.map<DropdownMenuItem<String>>((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) => setState(() {
        value = newValue!;
      }),
    );
  }
}
