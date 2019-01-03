import 'package:flutter/material.dart';
import 'package:password_memory/state/global_state.dart';
import 'package:password_memory/state/models/entradas.dart';

class ListViewEntradas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalInheritedWidgetState state = GlobalInheritedWidget.of(context, false);
    return SafeArea(
      child: StreamBuilder(
        stream: state.entradas.entradas,
        builder: (BuildContext context, AsyncSnapshot snap) {
          List<Entradas> entradas;

          if (snap.hasData && snap.data != null)
            entradas = snap.data;
          else
            entradas = [];

          return ListView.builder(
            itemCount: entradas.length,
            itemBuilder: (BuildContext context, int position) {
              Entradas entrada = entradas[position];
            Divider();
              return Dismissible(
                key: Key(entrada.id.toString()),
                onDismissed: (direction) {
                  state.entradas.deleteentrada(entrada.id);
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${entrada.titulo} eliminado!",
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
                  title: Text(entrada.titulo),
                  subtitle: Text(entrada.usuario),
                  dense: true,
                  //leading: Text(entrada.id?.toString() ?? ''),
                  leading: CircleAvatar(
                    child: Text(entrada.id.toString()),
                  ),
                  trailing: Icon(Icons.vpn_key),
                  onTap: () {
                    state.entradas.updateentrada(
                      Entradas(
                        titulo: entrada.titulo,
                        usuario: entrada.usuario,
                        password: entrada.password,
                        link: entrada.link,
                        nota: entrada.nota,
                        idGrupo: entrada.idGrupo,
                        id: entrada.id,
                      ),
                      position,                    
                    );
                    /*print(" TITULO>>   ${entrada.titulo}");
                    print(" USUARIO>>  ${entrada.usuario}");
                    print(" PASS>>     ${entrada.password}");
                    print(" link>>     ${entrada.link}");
                    print(" NOTA>>     ${entrada.nota} ");
                    print(" GRUPO>>    ${entrada.idGrupo} ");*/
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                        " TITULO=  ${entrada.titulo} / USUARIO=  ${entrada.usuario} / PASS=  ${entrada.password} / LINK=  ${entrada.link} / NOTA=  ${entrada.nota} / GRUPO=  ${entrada.idGrupo}",
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
