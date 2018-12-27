import 'package:flutter/material.dart';

class InputDatePicker extends StatefulWidget {
  InputDatePicker({this.dateTime, this.onDateChange});

  final DateTime dateTime;
  final Function(DateTime) onDateChange;
  @override
  _InputDatePickerState createState() => _InputDatePickerState();
}

class _InputDatePickerState extends State<InputDatePicker> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.dateTime != null
            ? '${widget.dateTime.day}-${widget.dateTime.month}-${widget.dateTime.year}'
            : 'Elegir una fecha...',
      ),
      subtitle: Text('Vencimiento'),
      onTap: () {
        showDatePicker(
          context: context,
          lastDate: DateTime(2050),
          firstDate: DateTime(2010),
          initialDate: widget.dateTime ?? DateTime.now(),
        ).then(
          (DateTime dt) {
            widget.onDateChange(dt);
          },
        );
      },
    );
  }
}
