import 'package:flutter/material.dart';
import 'package:password_memory/state/global_state.dart';
import 'package:password_memory/state/models/grupos.dart';

class ListViewGrupos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalInheritedWidgetState state = GlobalInheritedWidget.of(context, false);
    return SafeArea(
      child: StreamBuilder(
        stream: state.grupos.grupos,
        builder: (BuildContext context, AsyncSnapshot snap) {
          List<Grupos> grupos;

          if (snap.hasData && snap.data != null)
            grupos = snap.data;
          else
            grupos = [];

          return ListView.builder(
            itemCount: grupos.length,
            itemBuilder: (BuildContext context, int position) {
              Grupos grupo = grupos[position];
               Divider();
              return Dismissible(
                key: Key(grupo.id.toString()),
                onDismissed: (direction) {
                  state.grupos.deletegrupo(grupo.id);
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${grupo.nombre} eliminado!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                  ),
                ),
                direction: DismissDirection.endToStart,
                child: ListTile(
                  title: Text(grupo.nombre),
                  subtitle: Text(grupo.color),
                  //leading: Text(grupo.id?.toString() ?? ''),
                   leading: CircleAvatar(
                    child: Text(grupo.id.toString()),
                    backgroundColor: Colors.red,
                    
                  ),
                   trailing: Icon(Icons.group),
                  onTap: () {
                    state.grupos.updategrupo(
                      Grupos(
                        nombre: grupo.nombre,
                        color: grupo.color,
                        id: grupo.id,
                      ),
                      position,
                    );
                   /*print("NOMBRE>>>  ${grupo.nombre}");
                    print("COLOR>>>>  ${grupo.color}");*/
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                        " NOMBRE=  ${grupo.nombre} / COLOR=  ${grupo.color}",
                        textAlign: TextAlign.center,
                      ),
                    ));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

//Print(String title) {}
