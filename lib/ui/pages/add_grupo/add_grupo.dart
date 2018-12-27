import 'package:flutter/material.dart';
import 'package:password_memory/state/global_state.dart';
import 'package:password_memory/state/models/grupos.dart';
import 'package:password_memory/ui/componentes/input_color.dart';
import 'package:password_memory/ui/componentes/input_text.dart';
import 'package:password_memory/ui/componentes/scaffolf_form.dart';


class AddGrupo extends StatefulWidget {
  @override
  _AddGrupoState createState() => _AddGrupoState();
}

class _AddGrupoState extends State<AddGrupo> {
  TextEditingController nombreController = TextEditingController(),
      colorController = TextEditingController();
  
  FocusNode nombreNode = FocusNode();

  add(BuildContext context, GlobalInheritedWidgetState state) {
    if (nombreController.text.trim() == '' || nombreController.text == null) {
      return;
    }  

    //if (colorController.text.trim() == '' ||
       // colorController.value == null) return;

    Grupos grupo = Grupos(
        nombre: nombreController.text.trim(),        
        color: colorController.text.trim());

    state.grupos.insertgrupo(grupo);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    GlobalInheritedWidgetState state = GlobalInheritedWidget.of(context, false);
    return ScaffoldForm(
      add: () => this.add(context, state),
      title: 'Nuevo Grupo',
      body: ListView(
        children: <Widget>[
          InputText(
            controller: nombreController,
            autofocus: true,
            labelText: 'Nombre',
            focusNode: nombreNode,
           // nextFocusNode: colorNode,
          ),         
          InputColor(
            hint: 'Color del Grupo...',
          ),
        ],
      ),
    );
  }
}
