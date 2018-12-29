import 'package:flutter/material.dart';
import 'package:password_memory/state/global_state.dart';

class InputColor extends StatefulWidget {
  InputColor({@required this.hint, @required this.value, this.valueChange});

  final String hint;
   final String value;
  final Function(String) valueChange;

  @override
  _InputColorState createState() => _InputColorState();
}

class _InputColorState extends State<InputColor> {
  @override
  Widget build(BuildContext context) {
  GlobalInheritedWidgetState state = GlobalInheritedWidget.of(context);
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
          value: 'Verde',
        ),
      ],
      value: widget.value ?? 'col-1',
      onChanged: (item) {
              //state.grupos.addValue(item);
              widget.valueChange(item);
             print(item);
            },
      hint: Text(widget.hint),
    ));
  }
}
