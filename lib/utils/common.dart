import 'package:ceu_student/security/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future<String> getMobileToken() async {
  final SharedPreferences prefs = await _prefs;
  return prefs.getString(MOBILE_TOKEN_KEY) ?? '';
}

Future<bool> setMobileToken(String token) async {
  final SharedPreferences prefs = await _prefs;

  return prefs.setString(MOBILE_TOKEN_KEY, token);
}

void showLoginError(GlobalKey<ScaffoldState> mScaffoldState, BuildContext context, String message) {
  final snackBar = new SnackBar(
    content: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(message, style: TextStyle(fontSize: 17),),
          FlatButton(
            child: Text('LOGIN', style: TextStyle(color: Colors.blue)),
            onPressed: () {
              setMobileToken('');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
        ],
      ),
    ),
    duration: Duration(seconds: 4),
  );
  mScaffoldState.currentState.showSnackBar(snackBar);
}

void showError(GlobalKey<ScaffoldState> mScaffoldState, String message) {
  final snackBar = new SnackBar(
    content: Text(message, style: TextStyle(fontSize: 17),),
    duration: Duration(seconds: 4),
  );
  mScaffoldState.currentState.showSnackBar(snackBar);
}

void logout(BuildContext context) {
  setMobileToken('');
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}