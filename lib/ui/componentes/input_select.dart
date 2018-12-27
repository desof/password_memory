import 'package:flutter/material.dart';

class InputSelect extends StatefulWidget {
  InputSelect({@required this.hint});

  final String hint;
  @override
  _InputSelectState createState() => _InputSelectState();
}

class _InputSelectState extends State<InputSelect> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: DropdownButtonFormField(
      items: [
        DropdownMenuItem(
          child: Text('GRUPO 1'),
          value: 'cat-1',
        ),
        DropdownMenuItem(
          child: Text('GRUPO 2'),
          value: 'cat-2',
        ),
      ],
      value: null,
      onChanged: (item) {
        print(item);
      },
      hint: Text(widget.hint),
    ));
  }
}
