import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ceu_student/utils/common.dart';
import '../constant.dart';

class ChangePassword extends StatefulWidget {

  ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _PasswordData {
  String currentPassword = '';
  String newPassword = '';
  String newPassword2 = '';
}

class _ChangePasswordState extends State<ChangePassword> {

  final _formKey = GlobalKey<FormState>();
  _PasswordData _data = new _PasswordData();

  final GlobalKey<ScaffoldState> mScaffoldState = new GlobalKey<
      ScaffoldState>();
  final GlobalKey<
      RefreshIndicatorState> _refreshIndicatorKeyProfilePage = GlobalKey<
      RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      _refreshIndicatorKeyProfilePage.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Change Password', style: TextStyle(color: Colors.black)),
          leading: IconButton(
              icon: Icon(
                  Icons.arrow_back_ios, color: Colors.blueAccent, size: 25),
              onPressed: () {
                Navigator.pop(context);
              }
          )
      ),
      body: Container(
        color: Colors.white,
        child: Column(
            children: <Widget>[
        Container(color: Color(0xFFF5F5F5), height: 15,),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(fontSize: 15),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Current Password",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter current password';
                        }
                      },
                      onSaved: (String value) {
                        this._data.currentPassword = value;
                      }
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20),),
                  TextFormField(
                      style: TextStyle(fontSize: 15),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "New Password",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter new password';
                        }
                      },
                      onSaved: (String value) {
                        this._data.newPassword = value;
                      }
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20),),
                  TextFormField(
                      style: TextStyle(fontSize: 15),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Retype New Password",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please retype new password';
                        }
                      },
                      onSaved: (String value) {
                        this._data.newPassword2 = value;
                      }
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20),),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 19.0),
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.red,
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, we want to show a Snackbar
                            _formKey.currentState.save();
                            if (_data.newPassword == _data.newPassword2) {
                              Scaffold.of(context)
                                  .showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                              changePassword(_data.currentPassword, _data.newPassword);
                            } else {
                              Scaffold.of(context)
                                  .showSnackBar(SnackBar(content: Text(
                                  'New password is not same with retype password')));
                            }
                          }
                        },
                        child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 16),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    )),
    );
  }

  Future<void> changePassword(String _currentPassword, String _newPassword) async{
    try {
      String token = await getMobileToken();
      var httpClient = new HttpClient();
      var request = await httpClient.putUrl(Uri.parse('$URL/studentapp/profile/changepassword'));
      request.headers.set('Authorization', 'Bearer $token');
      request.headers.set('content-type', 'application/json');
      Map map = {
        'currentPassword': _currentPassword,
        'newPassword': _newPassword,
      };
      request.add(utf8.encode(json.encode(map)));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        _formKey.currentState.reset();
        logout(context);
      } else if (response.statusCode == HttpStatus.forbidden) {
        showLoginError(mScaffoldState, context, 'Session Expired');
      } else {
        showError(mScaffoldState, 'Error change password');
      }
    } catch (exception) {
      showError(mScaffoldState, 'Error change password');
    }
  }
}
