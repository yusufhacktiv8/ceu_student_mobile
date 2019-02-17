import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ceu_student/utils/common.dart';
import '../components/round_button.dart';
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

  final GlobalKey<ScaffoldState> mScaffoldState = new GlobalKey<
      ScaffoldState>();
  final GlobalKey<
      RefreshIndicatorState> _refreshIndicatorKeyProfilePage = GlobalKey<
      RefreshIndicatorState>();

  final _formKey = GlobalKey<FormState>();
  _PasswordData _data = new _PasswordData();
  bool loading = false;

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
      key: mScaffoldState,
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
                    style: TextStyle(fontSize: 15, color: Colors.black),
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
                      style: TextStyle(fontSize: 15, color: Colors.black),
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
                      style: TextStyle(fontSize: 15, color: Colors.black),
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
                  Padding(padding: EdgeInsets.only(bottom: 40),),
                  RoundButton(
                      loading: loading,
                      label: "Submit",
                      radius: 40.0,
                      onClick: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          if (_data.newPassword == _data.newPassword2) {
                            changePassword(_data.currentPassword, _data.newPassword);
                          } else {
                            showError(mScaffoldState, 'New password is not same with retype password');
                          }
                        }
                      }
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
      setState(() {
        loading = true;
      });
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
        setState(() {
          loading = false;
        });
        logout(context);
      } else if (response.statusCode == HttpStatus.forbidden) {
        setState(() {
          loading = false;
        });
        showLoginError(mScaffoldState, context, 'Security Error');
      } else {
        setState(() {
          loading = false;
        });
        showError(mScaffoldState, 'Error change password');
      }
    } catch (exception) {
      setState(() {
        loading = false;
      });
      showError(mScaffoldState, 'Error change password');
    }
  }
}
