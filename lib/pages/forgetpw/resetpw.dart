import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String newpassword;
  String token;
  String names;

  Future<void> resetPassword() async {
    final Response response = await patch(
      'http://10.0.2.2:8000/auth/password-reset-complete/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "password": newpassword,
        "token": token,
        "uidb64": names,
      }),
    );
  }

  Widget buildnewPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter  new password',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the new password';
        }
      },
      onSaved: (String value) {
        newpassword = value;
      },
      onChanged: (text) {
        newpassword = text;
      },
    );
  }

  Widget buildtokenField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter  token',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the token';
        }
      },
      onSaved: (String value) {
        token = value;
      },
      onChanged: (text) {
        token = text;
      },
    );
  }

  Widget buildnamesField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter  pin',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the pin';
        }
      },
      onSaved: (String value) {
        names = value;
      },
      onChanged: (text) {
        names = text;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Forgot password")),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Please enter the details',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )),
              SizedBox(height: 10),
              buildnewPasswordField(),
              SizedBox(height: 10),
              buildtokenField(),
              SizedBox(height: 10),
              buildnamesField(),
              SizedBox(height: 10),
              Container(
                  alignment: Alignment.center,
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.pink,
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      resetPassword();
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  )),
            ])));
  }
}
