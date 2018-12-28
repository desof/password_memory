import 'package:flutter/material.dart';

class InputSelect extends StatefulWidget {
  InputSelect({@required this.hint, @required this.value, this.valueChange});

  final String hint;
  final String value;
  final Function(String) valueChange;

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
      value: widget.value ?? 'cat-1',
      onChanged: (item) {
        widget.valueChange(item);
        print(item);
      },
      hint: Text(widget.hint),
    ));
  }
}
