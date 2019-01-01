import 'package:flutter/material.dart';

class Header extends AppBar {

  static final List<Choice> choices = const <Choice>[
    const Choice(title: 'Profile', icon: Icons.directions_bike),
    const Choice(title: 'Logout', icon: Icons.directions_car),
  ];

  final onSelect;

  Header({
    Key key,
    this.onSelect,// named parameter
  }) : super(key: key,
      centerTitle: true,
      leading: Icon(Icons.chat, color: Colors.blueAccent, size: 30,),
      title: Text('Dashboard',
            style: TextStyle(
                color: Colors.black)),
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: (choice) {
              onSelect(choice.title);
            },
            child: Container(
              margin: EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.account_circle, color: Colors.black12, size: 50,)
                ],
              ),
            ),
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ]
  );

//  @override
//  Widget build(BuildContext context) {
//    return AppBar(
//      // Here we take the value from the MyHomePage object that was created by
//      // the App.build method, and use it to set our appbar title.
//        centerTitle: false,
//        elevation: 2.0,
//        backgroundColor: Colors.white,
//        title: Text('Dashboard',
//            style: TextStyle(
//                color: Colors.black,
//                fontWeight: FontWeight.w700,
//                fontSize: 26.0)),
//        actions: <Widget>[
//          PopupMenuButton<Choice>(
////                onSelected: _select,
//            child: Container(
//              margin: EdgeInsets.only(right: 8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Icon(Icons.account_circle, color: Colors.black54)
//                ],
//              ),
//            ),
//            itemBuilder: (BuildContext context) {
//              return choices.map((Choice choice) {
//                return PopupMenuItem<Choice>(
//                  value: choice,
//                  child: Text(choice.title),
//                );
//              }).toList();
//            },
//          ),
//        ]
//    );
//  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}
