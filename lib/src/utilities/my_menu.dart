import 'package:flutter/material.dart';

class MyMenuDesign extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
        ),
        ListTile(
          title: Text('Flutter 1'),
          onTap: (){},
        ),
        ListTile(
          title: Text('Flutter 2'),
        ),
        ListTile(
          title: Text('Flutter 3'),
        )
      ]
    );
  }
}