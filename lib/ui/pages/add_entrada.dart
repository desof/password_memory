import 'package:flutter/material.dart';
import 'package:password_memory/state/global_state.dart';
import 'package:password_memory/state/models/entradas.dart';
import 'package:password_memory/ui/componentes/input_select.dart';
import 'package:password_memory/ui/componentes/input_text.dart';
import 'package:password_memory/ui/componentes/scaffolf_form.dart';

class AddEntrada extends StatefulWidget {
  @override
  _AddEntradaState createState() => _AddEntradaState();
}

class _AddEntradaState extends State<AddEntrada> {
  TextEditingController titleController = TextEditingController(),
      passwordController = TextEditingController(),
      usuarioController = TextEditingController(),
      linkController = TextEditingController(),
      notaController = TextEditingController(),
      idGrupoController = TextEditingController();

  // DateTime expiration;
  FocusNode titleNode = FocusNode(), usuarioNode = FocusNode();
  FocusNode passwordNode = FocusNode(), linkNode = FocusNode();
  FocusNode notaNode = FocusNode();

  String categoria;

  add(BuildContext context, GlobalInheritedWidgetState state) {
    if (titleController.text.trim() == '' || titleController.text == null) {
      return;
    }
    if (usuarioController.text.trim() == '' || usuarioController.value == null)
      return;

    if (passwordController.text.trim() == '' ||
        passwordController.value == null) return;

    if (linkController.text.trim() == '' || linkController.value == null)
      return;

    if (notaController.text.trim() == '' || notaController.value == null)
      return;

    //if (idGrupoController.text.trim() == ''|| notaController.value == null) return;
    if (categoria == null) {
      categoria = 'GENERAL';
    }
    Entradas entrada = Entradas(
        titulo: titleController.text.trim(),
        usuario: usuarioController.text.trim(),
        password: passwordController.text.trim(),
        link: linkController.text.trim(),
        nota: notaController.text.trim(),
        idGrupo: categoria);
    state.entradas.insertEntrada(entrada);
    /*Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("LISTO AGREGADO"),
    ));*/
     categoria = null;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    GlobalInheritedWidgetState state = GlobalInheritedWidget.of(context, false);
    return ScaffoldForm(
      add: () => this.add(context, state),
      title: 'Nueva entrada',
      body: ListView(
        children: <Widget>[
          InputText(
            controller: titleController,
            autofocus: true,
            labelText: 'Título',
            focusNode: titleNode,
            nextFocusNode: usuarioNode,
          ),
          InputText(
            controller: usuarioController,
            labelText: 'Usuario',
            focusNode: usuarioNode,
            nextFocusNode: passwordNode,
          ),
          InputText(
            controller: passwordController,
            labelText: 'Password',
            focusNode: passwordNode,
            nextFocusNode: linkNode,
          ),
          InputText(
            controller: linkController,
            labelText: 'Link',
            focusNode: linkNode,
            nextFocusNode: notaNode,
          ),
          InputText(
            controller: notaController,
            labelText: 'Nota',
            focusNode: notaNode,
            //nextFocusNode: notaNode,
          ),
          InputSelect(
              hint: 'Seleccionar grupo...',
              value: categoria,
              valueChange: (String value) {
                setState(() {
                  categoria = value;
                  print(categoria);
                });
              }),
        ],
      ),
    );
  }
}
