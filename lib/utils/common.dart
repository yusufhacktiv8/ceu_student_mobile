import 'dart:convert';

import 'package:ceu_student/security/login_page.dart';
import 'package:ceu_student/profile/profile_page.dart';
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

void profile(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfilePage()),
  );
}

void logout(BuildContext context) {
  setMobileToken('');
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}

Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }