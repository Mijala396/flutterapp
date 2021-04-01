import 'package:flutter/material.dart';
//import 'package:flutter_application_1/registration_option.dart';
import 'package:flutter_application_1/homepage_student.dart';
import 'package:flutter_application_1/homepage_tutor.dart';
import 'package:flutter_application_1/registration_form.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login section',
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
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
                  margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter username',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter password',
                    ),
                  ),
                ),
                /*Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.pink,
                      child: Text('Login as student'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),*/
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Login as:',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TutorHome()),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentHome()),
                        ); // Do something here
                      },
                    ),
                  ],
                ),
                /*Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.pink,
                      child: Text('Login as tutor'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),*/
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Formscreen2()),
                        );
                      },
                    )),
              ],
            )));
  }
}
