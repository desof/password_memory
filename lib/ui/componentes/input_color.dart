import 'package:flutter/material.dart';
import 'package:password_memory/state/models/grupos.dart';

class InputColor extends StatefulWidget {
  InputColor({@required this.hint});

  final String hint;
  @override
  _InputColorState createState() => _InputColorState();
}

class _InputColorState extends State<InputColor> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: DropdownButtonFormField(
      items: [
        DropdownMenuItem(
          child: Text('Rojo'),
          value: 'col-1',
        ),
        DropdownMenuItem(
          child: Text('Azul'),
          value: 'col-2',
        ),
        DropdownMenuItem(
          child: Text('Amarillo'),
          value: 'col-3',
        ),
        DropdownMenuItem(
          child: Text('Verde'),
          value: 'col-4',
        ),
      ],
      value: null,
      onChanged: (item) {
        print(item);
        setState(() {
                  Grupos(color:item);
                });
      },
      hint: Text(widget.hint),
    ));
  }
}
