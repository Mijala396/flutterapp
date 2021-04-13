import 'package:flutter/material.dart';
import 'package:flutter_application_1/registration_option.dart';
import 'file:///E:/Andriod%20Projetcs/Fyp/flutterapp/lib/pages/Home/homepage_student.dart';
import 'file:///E:/Andriod%20Projetcs/Fyp/flutterapp/lib/Tutor/Home/homepage_tutor.dart';

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
                          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'login as:',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )),
                      SizedBox(height: 5),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new RaisedButton(
                            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                            textColor: Colors.white,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              "Tutor",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            elevation: 5.0,
                            onPressed: () {
                              if (!formKey.currentState.validate()) {

                                return;
                              }

                              formKey.currentState.save();
                              print(username);
                              print(email);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TutorHome()),
                              ); // Do something here
                            },
                          ),
                          new RaisedButton(
                            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                            textColor: Colors.white,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              "Student",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            elevation: 5.0,
                            onPressed: () {
                              if (!formKey.currentState.validate()) {
                                return;
                              }

                              formKey.currentState.save();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentHome()),
                              ); // Do something here
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 110, 0, 0),
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
                    },
                  )),
            ])));
  }
}
