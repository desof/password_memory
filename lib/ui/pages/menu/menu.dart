import 'package:flutter/material.dart';
import 'package:password_memory/ui/pages/grupos/grupos.dart';
import 'package:password_memory/ui/pages/home/home.dart';
import 'package:flutter/services.dart';

class MiMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blueAccent,
      statusBarColor: Colors.blueAccent,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Contraseñas'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton.icon(
                  icon: const Icon(Icons.add, size: 18.0),
                  label:
                      const Text('GRUPOS', semanticsLabel: 'RAISED BUTTON 2'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => MisGrupos(),
                      ),
                    );
                  },
                ),
              ),
              RaisedButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label:
                    const Text('ENTRADAS', semanticsLabel: 'RAISED BUTTON 2'),
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

  Widget buildRaisedButton() {
    return Align(
      alignment: const Alignment(0.0, -0.2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                child: const Text('RAISED BUTTON',
                    semanticsLabel: 'RAISED BUTTON 1'),
                onPressed: () {
                  // Perform some action
                },
              ),
              const RaisedButton(
                child: Text('DISABLED', semanticsLabel: 'DISABLED BUTTON 1'),
                onPressed: null,
              ),
            ],
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label: const Text('RAISED BUTTON',
                    semanticsLabel: 'RAISED BUTTON 2'),
                onPressed: () {
                  // Perform some action
                },
              ),
              RaisedButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label:
                    const Text('DISABLED', semanticsLabel: 'DISABLED BUTTON 2'),
                onPressed: null,
              ),
            ],
          ),
        ],
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
