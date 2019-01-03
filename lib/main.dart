import 'package:flutter/material.dart';
import 'package:password_memory/state/global_state.dart';
import 'package:password_memory/ui/pages/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalInheritedWidget(
      child: MaterialApp(
        title: 'MIS CONTRASEÑAS',
        theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor:  Colors.blueAccent,
        ),
          home: Home(),
      ),
    );
  }
}