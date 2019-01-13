import 'package:flutter/material.dart';
import 'package:ceu_student/components/header.dart';

class Sgl extends StatefulWidget {

  final String title;

  Sgl({Key key, this.title}) : super(key: key);

  @override
  _SglState createState() => _SglState();
}

class _SglState extends State<Sgl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(label: widget.title, onSelect: (title) {
//          logout(title);
      },
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.blueAccent, size: 25),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(color: Color(0xFFF5F5F5), height: 15,),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.check_box, color: Colors.blue, size: 35,),
                    title: Text("Angina Pektoris, Infark Miokard (3B)",
                        style: TextStyle(fontSize: 16)),
                    trailing: Text("29/12/2018",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                  ),
                  Divider(),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
