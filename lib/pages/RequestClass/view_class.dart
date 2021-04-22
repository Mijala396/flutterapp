import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StudentClass extends StatefulWidget {
  @override
  _StudentClassState createState() => _StudentClassState();
}

class _StudentClassState extends State<StudentClass> {
  List sessions = [];
  List data = [];
  Future<void> getstudentSessions() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response = await get(
      'http://10.0.2.2:8000/auth/session-approved/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    try {
      data = jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
    setState(() {
      sessions = data;
    });
    print(sessions);
  }

  @override
  void initState() {
    getstudentSessions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('session'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: sessions
                .map<Widget>((item) => Column(
                      children: <Widget>[
                        Card(
                          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  'Name : ${item['student_name']} ${item['student_lastname']}',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.grey[800]),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'Subject : ${item['subject']}',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[800]),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'email : ${item['student_email']} ',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.grey[800]),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'session_date : ${item['session_date']}',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[800]),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'session_enddate : ${item['session_enddate']}',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[800]),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'message : ${item['message']}',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[800]),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'duration : ${item['session_duration']} ',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.grey[800]),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RaisedButton.icon(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/studentBill',
                                              arguments: {
                                                'id': item['id'],
                                                'student_name':
                                                    item['student_name'],
                                                'student_lastname':
                                                    item['student_lastname'],
                                                'tutor_name':
                                                    item['tutor_name'],
                                                'tutor_lastname':
                                                    item['tutor_lastname'],
                                                'tutor_chargePerHour':
                                                    item['tutor_chargePerHour'],
                                              });
                                          //getAcceptrequest(item['data']);
                                        },
                                        label: Text('generate bill'),
                                        icon: Icon(Icons.info)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ))
                .toList(),
          ),
        ));
  }
}
