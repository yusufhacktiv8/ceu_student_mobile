import 'package:badge/badge.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {

  final int status;

  Status({Key key,
    @required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Color(0xFFFFFFFF);
    var description = '';
    switch (status) {
      case 0:
        description = 'Scheduled';
        color = Color(0xFF9DA5BE);
        break;
      case 1:
        description = 'On Going';
        color = Color(0xFF5093E1);
        break;
      case 2:
        description = 'Completed';
        color = Color(0xFF50C14E);
        break;
      case 3:
        description = 'Problem';
        color = Color(0xFFF65177);
        break;
      case 4:
        description = 'Pending';
        color = Color(0xFF000);
        break;
      default:
        break;
    }
    return Badge.before(
      textStyle: TextStyle(fontSize: 2.0),
      spacing: 5,
      color: color,
      value: " ",
      child: Text(description, style: TextStyle(fontSize: 16, color: Colors.black87),),
    );
  }
}