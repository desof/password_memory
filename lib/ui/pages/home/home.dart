import 'package:flutter/material.dart';
import 'package:password_memory/ui/pages/add_entrada/add_entrada.dart';
import 'package:password_memory/ui/pages/home/componentes/bottom_app_bar.dart';
import 'package:password_memory/ui/pages/home/componentes/listview_entradas.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: AppBar(
        title: Text('MIS CONTRASEÑAS'),
      ),
      body: ListViewEntradas(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => AddEntrada(),
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
