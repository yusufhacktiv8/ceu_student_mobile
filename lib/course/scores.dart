import 'package:flutter/material.dart';

class Scores extends StatefulWidget {
  @override
  _ScoresState createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Text("85.0", style: TextStyle(fontSize: 30),),
            title: Text("Case Report"),
            subtitle: Text("29/12/2018"),
          ),
          Divider(),
          ListTile(
            leading: Text("100.0", style: TextStyle(fontSize: 30),),
            title: Text("Weekly Discussion"),
            subtitle: Text("29/12/2018"),
          ),
          Divider(),
          ListTile(
            leading: Text("100.0", style: TextStyle(fontSize: 30),),
            title: Text("Case Test"),
            subtitle: Text("29/12/2018"),
          ),
          Divider(),
        ],
      ),
    );
  }
}
