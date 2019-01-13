import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import '../components/input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/round_button.dart';
import '../constant.dart';
import '../dashboard/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();
  final LoginFormValue _formValue = new LoginFormValue();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Center(
//                  child: Text("CEU", style: TextStyle(fontSize: 50, color: Colors.blue, fontWeight: FontWeight.bold),),
                  child: Icon(Icons.check_circle, size: 80, color: Colors.blue,),
                ),
              ),
            ),
            Container(
              height: 90,
              child: Column(
                children: <Widget>[
//                  Icon(Icons.check_circle, size: 60, color: Colors.blue,),
                  Padding(padding: EdgeInsets.only(bottom: 10),),
                  Text("CEU Student", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.only(bottom: 8),),
                  Text("Clinical Education Unit for Student", style: TextStyle(color: Colors.grey)),
                  Padding(padding: EdgeInsets.only(bottom: 20),),
                ],
              ),
            ),
            Container(
              height: 270,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                Form(
                key: _formKey,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new InputField(
                          hint: "Username",
                          obscure: false,
                          icon: Icons.person_outline,
                          onSaved: (String value) {
                            this._formValue.username = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter username';
                            }
                          },
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10),),
                      new InputField(
                          hint: "Password",
                          obscure: true,
                          icon: Icons.lock_outline,
                          onSaved: (String value) {
                            this._formValue.password = value;
                          },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          }
                        },
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 30),),
                      RoundButton(
                        loading: loading,
                          label: "Sign In",
                          radius: 40.0,
                        onClick: () {
                          if(_formKey.currentState.validate()) {
                            login();
                          }
                        }
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Future<void> login() async{

    if (loading) return;

    _formKey.currentState.save();
    setState(() {
      loading = true;
    });
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.postUrl(Uri.parse('$URL/security/signin'));
      request.headers.set('content-type', 'application/json');
      Map map = {
        'username': _formValue.username,
        'password': _formValue.password,
      };
      request.add(utf8.encode(json.encode(map)));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var dataString = await response.transform(utf8.decoder).join();
        var data = json.decode(dataString);
        var token = data["token"];
        await _setMobileToken(token);
        _formKey.currentState.reset();
        setState(() {
          loading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
      } else if (response.statusCode == HttpStatus.forbidden) {
        _showDialog("Invalid Credentials");
        setState(() {
          loading = false;
        });
      } else {
        _showDialog("Connection Error");
        setState(() {
          loading = false;
        });
      }
    } catch (exception) {
      _showDialog("Connection Error");
      setState(() {
        loading = false;
      });
    }
  }

  Future<bool> _setMobileToken(String token) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(MOBILE_TOKEN_KEY, token);
  }

  void _showDialog(String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Login Error"),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LoginFormValue {
  String username = '';
  String password = '';
}
