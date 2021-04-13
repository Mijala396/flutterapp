import 'package:flutter/material.dart';
import 'file:///E:/Andriod%20Projetcs/Fyp/flutterapp/lib/Tutor/Registration/registration_form.dart';
import 'file:///E:/Andriod%20Projetcs/Fyp/flutterapp/lib/pages/Home/homepage_student.dart';
import 'file:///E:/Andriod%20Projetcs/Fyp/flutterapp/lib/Tutor/Home/homepage_tutor.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Formscreentutor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Formscreentutorstate();
  }
}

class Formscreentutorstate extends State<Formscreentutor> {
  String username;
  String email;
  bool invalidCred = false;

  Future<void> getData(String email, String password) async {
    print(email.trim());
    print(password);
    try{

      final Response response = await post(
        'http://10.0.2.2:8000/auth/login/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email":email.trim(),
          "password":password,
        }),
      );
      Map data = jsonDecode(response.body);
      Future<void> __storejwt() async{
        final pref = await SharedPreferences.getInstance();
        await pref.setString('token', data['tokens']['access']);
        final token = pref.getString('token');
        print(token);
      }
      bool Authenticated = data.containsKey('tokens');


      if(Authenticated){
        if(data['is_teacher']){
        __storejwt();
        Navigator.pushReplacementNamed(context, '/tutorHome');
        }
      }

      setState(() {
        invalidCred =true;
      });
      print('Invalid Credentials');


    }
    catch(e){
      print('There was an error');
      setState(() {
        invalidCred =true;
      });
    }
  }

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
                    'Welcome Tutor!',
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
                    Column(
                      children: <Widget>[
                        if (invalidCred)...[
                          SizedBox(height: 5),
                          Text(
                              'Invalid Credentails',
                            style: TextStyle(
                              color:Colors.redAccent,
                              fontSize: 16,
                            ),
                          ),
                ]
                      ],
                    ),
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
                              "Login for tutor",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            elevation: 5.0,
                            onPressed: () async {
                              if (!formKey.currentState.validate()) {
                                return;
                              }

                              formKey.currentState.save();
                              await getData(username,email);

                            },
                          ),
                        ],
                      ),
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
                        MaterialPageRoute(builder: (context) => Formscreen2()),
                      );
                    },
                  )),
            ])));
  }
}
