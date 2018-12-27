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
          List<Entradas> products;

          if (snap.hasData && snap.data != null)
            products = snap.data;
          else
            products = [];

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int position) {
              Entradas product = products[position];

              return Dismissible(
                key: Key(product.id.toString()),
                onDismissed: (direction) {
                  state.entradas.deleteentrada(product.id);
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${product.titulo} eliminado!",
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
                  title: Text(product.titulo),
                  subtitle: Text(product.usuario),
                  leading: Text(product.id?.toString() ?? ''),
                  onTap: () {
                    state.entradas.updateentrada(
                      Entradas(
                        titulo: product.titulo,
                        usuario: product.usuario,
                        password: product.password,
                        link: product.link,
                        nota: product.nota,
                        id: product.id,
                      ),
                      position,
                    );
                    print("${product.titulo} TITULO!");
                    print("${product.usuario} USUARIO!");
                    print("${product.password} PASS!");
                    print("${product.link} link!");
                    print("${product.nota} NOTA!");
                    
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
