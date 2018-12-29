import 'package:flutter/material.dart';

class Portofolios extends StatefulWidget {
  @override
  _PortofoliosState createState() => _PortofoliosState();
}

class _PortofoliosState extends State<Portofolios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green,),
            title: Text("Hipertensi esensial"),
            subtitle: Text("29/12/2018"),
          )
        ],
      ),
    );
  }
}
