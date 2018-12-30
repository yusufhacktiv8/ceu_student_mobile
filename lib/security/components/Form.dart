import 'package:flutter/material.dart';
import './InputFields.dart';

final _formKey = GlobalKey<FormState>();

class FormContainer extends StatelessWidget {
  var formKey;
  var formValue;

  FormContainer({Key key, this.formKey, this.formValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (new Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Form(
            key: formKey,
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new InputFieldArea(
                hint: "Username",
                obscure: false,
                icon: Icons.person_outline,
                onSaved: (String value) {
                  this.formValue.username = value;
                }
              ),
              new InputFieldArea(
                hint: "Password",
                obscure: true,
                icon: Icons.lock_outline,
                  onSaved: (String value) {
                    this.formValue.password = value;
                  }
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
