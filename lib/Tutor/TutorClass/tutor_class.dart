import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TutorClass extends StatefulWidget {
  @override
  _TutorClassState createState() => _TutorClassState();
}

class _TutorClassState extends State<TutorClass> {
  List sessions;
  Future<void> getTutorSessions()async{
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response = await get(
        'http://10.0.2.2:8000/auth/session-approve/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':"Bearer $token"
        },
    );

    sessions = jsonDecode(response.body);

    print(sessions);

  }

  @override
  void initState()  {
    getTutorSessions();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
