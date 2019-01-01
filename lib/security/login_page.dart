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
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Center(
//                  child: Text("CEU", style: TextStyle(fontSize: 50, color: Colors.blue, fontWeight: FontWeight.bold),),
                  child: Icon(Icons.check_circle, size: 80, color: Colors.blue,),
                ),
              ),
            ),
            Container(
              height: 70,
              child: Column(
                children: <Widget>[
//                  Icon(Icons.check_circle, size: 60, color: Colors.blue,),
                  Padding(padding: EdgeInsets.only(bottom: 10),),
                  Text("Sign in", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("Clinical Education Unit", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Container(
              height: 270,
              padding: EdgeInsets.only(left: 20, right: 20),
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
