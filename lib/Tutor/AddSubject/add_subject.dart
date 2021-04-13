import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AddSubject extends StatefulWidget {
  @override
  _AddSubjectState createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  String _value = 'Maths';
  String value1 = "Highschool";
  String values;

  Future<void> addSubject() async{
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response = await post(
      'http://10.0.2.2:8000/auth/add-subject/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':"Bearer $token"
      },
      body:jsonEncode(<String, String>{
          "subject_name": _value
        }
      )
    );

    Navigator.pushNamed(context, '/tutorProfile');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Search section',
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              SizedBox(height: 10),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Select subject',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.pink,
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              " Maths",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            value: 'Maths',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Science",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            value: 'Science',
                          ),
                          DropdownMenuItem(
                              child: Text(
                                "English",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              value: 'English'),
                          DropdownMenuItem(
                              child: Text(
                                "Social",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              value: 'Social')
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        })),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                  alignment: Alignment.center,
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.pink,
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {

                      addSubject();

                    },
                  )),
            ])));;
  }
}
