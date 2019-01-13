import 'package:flutter/material.dart';
import 'package:ceu_student/components/header.dart';

class Details extends StatefulWidget {

  final String title;

  Details({Key key, this.title}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
                    leading: Icon(Icons.calendar_today),
                    title: Text("1 Jan 1980",
                        style: TextStyle(fontSize: 16)),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.mobile_screen_share),
                    title: Text("012345678",
                        style: TextStyle(fontSize: 16)),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("012345678",
                        style: TextStyle(fontSize: 16)),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("testhello99@gmail.com",
                        style: TextStyle(fontSize: 16)),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Jl. A.P.Pettarani",
                        style: TextStyle(fontSize: 16)),
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
