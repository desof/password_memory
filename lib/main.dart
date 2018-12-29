import 'package:flutter/material.dart';
import 'package:password_memory/state/global_state.dart';
//import 'package:password_memory/ui/pages/grupos/grupos.dart';
import 'package:password_memory/ui/pages/menu/menu.dart';
//import 'package:password_memory/ui/pages/home/home.dart';

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
        //home: Home(),
        //home: MisGrupos(),
          home: MiMenu(),
      ),
    );
  }
}