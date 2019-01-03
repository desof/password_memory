import 'package:flutter/material.dart';
import 'package:password_memory/ui/pages/add_entrada.dart';
import 'package:password_memory/ui/pages/add_grupo.dart';
import 'package:password_memory/ui/pages/entradas.dart';
import 'package:password_memory/ui/pages/grupos.dart';
import 'package:password_memory/ui/pages/favoritos.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Contraseñas'),
        backgroundColor: Colors.redAccent,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              child: Icon(Icons.vpn_key),
            ),
            Tab(
              child: Icon(Icons.add_to_photos),
            ),
            Tab(
              child: Icon(Icons.fastfood),
            )
          ],
          controller: _controller,
        ),
      ),
      body: TabBarView(
        children: <Widget>[MisEntradas(), MisGrupos(), MisFavoritos()],
        controller: _controller,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          if (_controller.index.toString() == '1') {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => (AddGrupo())));
          } else if (_controller.index.toString() == '0') {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => (AddEntrada())));
               // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked;
          } else {
            //OCULTAR BOTON FLOTANTE AQUI
           // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked;
          }
          print(_controller.index.toString());
          
        },
      ),
    );
  }
}
