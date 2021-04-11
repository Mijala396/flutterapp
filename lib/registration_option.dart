import 'package:flutter/material.dart';
import 'file:///E:/Andriod%20Projetcs/Fyp/flutterapp/lib/Tutor/Registration/registration_form.dart';
import 'file:///E:/Andriod%20Projetcs/Fyp/flutterapp/lib/pages/Register/registration_form2.dart';
//import 'package:flutter_application_1/registration_tutor.dart';
//import 'package:flutter_application_1/registraton_student.dart';

class Registeroption extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Registeroption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Registration Section',
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'If you are a tutor:',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.pink,
                      child: Text(
                        'Register here',
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
                        //signup screen
                      },
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'If you are searching for a tutor:',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.pink,
                      child: Text(
                        'Register here',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Formscreen3()),
                        ); //signup screen
                      },
                    )),
              ],
            )));
  }
}
