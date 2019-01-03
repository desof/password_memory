import 'package:flutter/material.dart';
import 'package:password_memory/ui/pages/add_grupo.dart';


class CustomBottomAppBar extends StatelessWidget {
  showMenu(BuildContext context) {
    final List<Map<String, String>> _items = [
      {'text': 'Entradas'},
      {'text': 'Grupos'},
      {'text': 'Acerca de...'},      
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 168,
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text(_items[position]['text']),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                     builder: (BuildContext context) => AddGrupo(),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  showFilters(BuildContext context) {
    final List<Map<String, String>> _items = [
      {'text': 'Categorias'},
      {'text': 'Vencimientos'},
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 112.0,
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text(_items[position]['text']),
                onTap: () {
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        );
      },
    );
  }

  showOrders(BuildContext context) {
    final List<Map<String, String>> _items = [
      {'text': 'Fecha de vencimiento'},
      {'text': 'Nombre'},
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 112.0,
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text(_items[position]['text']),
                onTap: () {
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        );
      },
    );
  }

  showListStyle(BuildContext context) {
    final List<Map<String, String>> _items = [
      {'text': 'Lista simple'},
      {'text': 'Lista detallada'},
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 112.0,
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text(_items[position]['text']),
                onTap: () {
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () => this.showMenu(context),
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        
        ],
      ),
    );
  }
}
