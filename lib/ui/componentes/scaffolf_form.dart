import 'package:flutter/material.dart';

class ScaffoldForm extends StatelessWidget {
  ScaffoldForm({this.title, this.body, this.add});
  final String title;
  final Widget body;
  final VoidCallback add;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: title != null ? Text(title) : null,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: this.add,
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: body,
    );
  }
}
