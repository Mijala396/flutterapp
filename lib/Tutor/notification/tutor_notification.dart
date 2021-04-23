import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class tutorNotification extends StatefulWidget {
  @override
  _tutorNotificationState createState() => _tutorNotificationState();
}

class _tutorNotificationState extends State<tutorNotification> {
  List finalData = [];
  List notificationdata;

  Future<void> getSessoionsforNotification() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    Response response = await get(
      'http://10.0.2.2:8000/auth/session-approve/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    List data = jsonDecode(response.body);

    Response notifyresponse = await get(
      'http://10.0.2.2:8000/auth/notifications/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    setState(() {
      notificationdata = jsonDecode(notifyresponse.body);
    });

    print(notificationdata);

    final today = (DateTime.now().toString()).substring(0, 10);
    setState(() {
      finalData = data
          .where(
              (element) => (element['session_date'].substring(0, 10) == today))
          .toList();
    });
  }

  @override
  void initState() {
    getSessoionsforNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Notifications',
          ),
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: finalData
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
                              'You have ${item['subject']} class today ${item['session_date']}',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.grey[800]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))
                    .toList(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: notificationdata
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
                              ' ${item['notification']}',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.grey[800]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))
                    .toList(),
              )
            ],

          ),

        ));
  }
}
