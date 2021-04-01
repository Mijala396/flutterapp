import 'package:flutter/material.dart';
import 'package:flutter_application_1/registration_form2.dart';
import 'package:flutter_application_1/homepage_student.dart';
import 'package:flutter_application_1/homepage_tutor.dart';
import 'package:flutter_application_1/Tutorlogin.dart';

class Formscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Formscreenstate();
  }
}

class Formscreenstate extends State<Formscreen> {
  String username;
  String email;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter username',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the username';
        }
      },
      onSaved: (String value) {
        username = value;
      },
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter password',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the password';
        }
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Search your tutor',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Welcome!',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Have an account? Sign in using username and password.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  )),
              Container(
                margin: EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildNameField(),
                      SizedBox(height: 15),
                      buildPasswordField(),
                      SizedBox(height: 5),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: RaisedButton(
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.pink,
                            child: Text(
                              'Login for student',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              if (!formKey.currentState.validate()) {
                                return;
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentHome()),
                              );
                            },
                          )),
                      SizedBox(height: 5),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          height: 50,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'If you are a tutor sign in here:',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          )),
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
                              'Tutor',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Formscreentutor()),
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'New here?',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )),
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
                      'sign up',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Formscreen3()),
                      );
                    },
                  )),
            ])));
  }
}
