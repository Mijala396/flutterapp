import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class TutorClassRequest extends StatefulWidget {
  @override
  _TutorClassRequestState createState() => _TutorClassRequestState();
}

class _TutorClassRequestState extends State<TutorClassRequest> {
  List sessions;
  Future<void> getSessionsRequest() async{
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response = await get(
      'http://10.0.2.2:8000/auth/request-session/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':"Bearer $token"
      },
    );

    sessions = jsonDecode(response.body);



    print('-------Sessions------');

    print(sessions);

    print('-------Sessions------');

  }
  @override
  void initState() {
    getSessionsRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold();
  }
}
