import 'package:flutter/material.dart';

class MisFavoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
           Icon(Icons.favorite,size: 170,color: Colors.blue,),
        ],
      ),
    );
  }
}