import 'package:flutter/material.dart';

class Kompre extends StatefulWidget {
  @override
  _KompreState createState() => _KompreState();
}

class _KompreState extends State<Kompre> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green,),
            title: Text("Final Kompre"),
            subtitle: Text("100.0"),
          )
        ],
      ),
    );
  }
}
