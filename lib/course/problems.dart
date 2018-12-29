import 'package:flutter/material.dart';

class Problems extends StatefulWidget {
  @override
  _ProblemsState createState() => _ProblemsState();
}

class _ProblemsState extends State<Problems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green,),
            title: Text("Problem 1"),
            subtitle: Text("29/12/2018"),
          )
        ],
      ),
    );
  }
}
