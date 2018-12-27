import 'package:flutter/widgets.dart';
import 'package:password_memory/state/providers/grupos.dart';

// Modelos
import 'providers/index.dart';

class _GlobalInherited extends InheritedWidget {
  _GlobalInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final GlobalInheritedWidgetState data;

  @override
  bool updateShouldNotify(_GlobalInherited oldWidget) {
    return true;
  }
}

class GlobalInheritedWidget extends StatefulWidget {
  GlobalInheritedWidget({Key key, this.child, this.isDebug = false})
      : super(key: key);

  final Widget child;
  final bool isDebug;

  @override
  GlobalInheritedWidgetState createState() => new GlobalInheritedWidgetState();

  static GlobalInheritedWidgetState of(
      [BuildContext context, bool rebuild = true]) {
    return (rebuild
            ? context.inheritFromWidgetOfExactType(_GlobalInherited)
                as _GlobalInherited
            : context.ancestorWidgetOfExactType(_GlobalInherited)
                as _GlobalInherited)
        .data;
  }
}

class GlobalInheritedWidgetState extends State<GlobalInheritedWidget> {
  EntradasProvider entradas;
  GruposProviders grupos;

  @override
  void initState() {
    super.initState();
    entradas = EntradasProvider();
    grupos = GruposProviders();
  }

  @override
  void dispose() {
    entradas.close();
    grupos.close();
    super.dispose();
  }

  void reset() {
    entradas.reset();
    grupos.close();
  }

  @override
  Widget build(BuildContext context) {
    return new _GlobalInherited(
      data: this,
      child: widget.child,
    );
  }
}
