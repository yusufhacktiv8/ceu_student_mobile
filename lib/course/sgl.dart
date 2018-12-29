import 'package:flutter/material.dart';

class Sgl extends StatefulWidget {
  @override
  _SglState createState() => _SglState();
}

class _SglState extends State<Sgl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green,),
            title: Text("Angina Pektoris, Infark Miokard (3B)"),
            subtitle: Text("29/12/2018"),
          )
        ],
      ),
    );
  }
}
