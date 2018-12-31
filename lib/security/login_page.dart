import 'package:flutter/material.dart';
import 'components/InputFields.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Container(
              height: 100,
              child: Column(
                children: <Widget>[
                  Text("Sign in", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("Clinical Education Unit", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Container(
              height: 300,
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                Form(
//                key: formKey,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new InputFieldArea(
                          hint: "Username",
                          obscure: false,
                          icon: Icons.person_outline,
  //                        onSaved: (String value) {
  //                          this.formValue.username = value;
  //                        }
                      ),
                      new InputFieldArea(
                          hint: "Password",
                          obscure: true,
                          icon: Icons.lock_outline,
  //                        onSaved: (String value) {
  //                          this.formValue.password = value;
  //                        }
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
}
