import 'package:flutter/material.dart';
import 'package:password_memory/ui/pages/grupos/grupos.dart';
import 'package:password_memory/ui/pages/home/home.dart';

class MiMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gupos disponibles'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
            RaisedButton(
              textColor: Colors.blueAccent,
              child: Text("Grupos"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MisGrupos(),
                  ),
                );
              },
            ),
            RaisedButton(
              textColor: Colors.blueAccent,
              child: Text("ENTRADAS"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Home(),
                  ),
                );
              },
            ),
          ],
          ),
        ),
      ),
    );
  }
}
/*

child: RaisedButton(
            child: Text('Grupos'),
            onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => MisGrupos(),
            ),
          );
        },
            color: Colors.amberAccent,
          ),         
import 'package:flutter/material.dart';
import 'package:password_memory/ui/pages/add_grupo/add_grupo.dart';
import 'package:password_memory/ui/pages/home/componentes/bottom_app_bar.dart';
import 'package:password_memory/ui/pages/home/componentes/listview_grupos.dart';

class MisGrupos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: AppBar(
        title: Text('Gupos disponibles'),
      ),
      body: ListViewGrupos(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => AddGrupo(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}

*/
