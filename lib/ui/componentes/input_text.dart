import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  InputText({
    this.labelText,
    this.controller,
    this.autofocus = false,
    this.focusNode,
    this.nextFocusNode,
  });

  final String labelText;
  final TextEditingController controller;
  final bool autofocus;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        autofocus: widget.autofocus,
        controller: widget.controller,
        textInputAction: widget.nextFocusNode != null
            ? TextInputAction.go
            : TextInputAction.done,
        focusNode: widget.focusNode,
        onFieldSubmitted: (String text) => widget.nextFocusNode != null
            ? FocusScope.of(context).requestFocus(widget.nextFocusNode)
            : widget.focusNode.unfocus(),
        decoration: InputDecoration(
          labelText: widget.labelText,
        ),
      ),
    );
  }
}
