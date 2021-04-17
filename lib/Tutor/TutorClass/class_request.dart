import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TutorClassRequest extends StatefulWidget {
  @override
  _TutorClassRequestState createState() => _TutorClassRequestState();
}

class _TutorClassRequestState extends State<TutorClassRequest> {
  List sessions = [];
  Future<void> getSessionsRequest() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response = await get(
      'http://10.0.2.2:8000/auth/request-session/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    List data = jsonDecode(response.body);
    setState(() {
      sessions = data;
    });

    print('-------Sessions------');

    print(sessions);

    print('-------Sessions------');
  }

  Future<void> updateStatus(id) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response = await patch(
      'http://10.0.2.2:8000/auth/approve-status/$id/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
  }

  @override
  void initState() {
    getSessionsRequest(); //page load hunu agadi data leyera dekhauna.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('session requests'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
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
                                  'Name : ${item['student_name']} ',
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
                                  'session_time : ${item['session_time']}',
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
                                    FlatButton.icon(
                                        onPressed: () {
                                          updateStatus(item["id"]);
                                        },
                                        label: Text('Accept request'),
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
