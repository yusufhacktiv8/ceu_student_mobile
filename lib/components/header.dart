import 'package:flutter/material.dart';

class Header extends AppBar {

  static final List<Choice> choices = const <Choice>[
    const Choice(title: 'Profile', id: 1),
    const Choice(title: 'Logout', id: 2),
  ];

  final label;
  final onSelect;
  final leading;

  Header({
    Key key,
    @required this.label,
    this.onSelect,// named parameter
    this.leading,
  }) : super(key: key,
      centerTitle: true,
      leading: leading,
      title: Text("$label",
            style: TextStyle(
                color: Colors.black)),
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: PopupMenuButton<Choice>(
            onSelected: (choice) {
              onSelect(choice);
            },
            child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: AssetImage(
                              'images/user.png',
                            ),
                            image: NetworkImage(
                                'https://picsum.photos/250?image=9'),
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
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
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
  const Choice({this.title, this.id});

  final String title;
  final int id;
}
