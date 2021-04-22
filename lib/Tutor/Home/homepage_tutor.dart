import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TutorHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<TutorHome> {
  FlutterLocalNotificationsPlugin fltrNotification;

  _showNotification(id, date) async {
    var parsedDate = DateTime.parse(date);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    print(today);
    // print(parsedDate);
    var androidDetails = new AndroidNotificationDetails("Class",
        "Student Notification", "This channel is for student notification",
        importance: Importance.Max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(androidDetails, iSODetails);

//    await fltrNotification.show(
//        0, "Class Notification", "You have class today  ",
//        generalNotificationDetails, payload: "Task");
    print('This code is running');
    if (DateTime.now().isAfter(parsedDate)) return null;
    var scheduledTime = parsedDate;
    fltrNotification.schedule(
        id,
        "Class Notification",
        'Your class is starting soon',
        scheduledTime,
        generalNotificationDetails);
  }

  Future<void> setupNotifications() async {
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

    print('Running Init');

    data.forEach((element) {
      print(element['session_date']);
      _showNotification(element['id'], element['session_date']);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    super.initState();
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
        new InitializationSettings(androidInitilize, iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
    setupNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Tutor Homepage',
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.pink,
                      child: Text(
                        'Your Profile',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/tutorProfile');
                      },
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 50, 200, 0),
                    height: 50,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.pink,
                      child: Text(
                        'Class request',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/tutorClassRequest');
                      },
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(200, 55, 10, 0),
                    height: 50,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.pink,
                      child: Text(
                        'View class',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/tutorClass');
                      },
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 60, 200, 0),
                    height: 50,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.pink,
                      child: Text(
                        'View history',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/tutorclasshistory');
                        //signup screen
                      },
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(200, 65, 10, 0),
                    height: 50,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.pink,
                      child: Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.pink,
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () async {
                        final pref = await SharedPreferences.getInstance();
                        await pref.setString('token', '');
                        Navigator.pushReplacementNamed(context, '/');
                      },
                    )),
              ],
            )));
  }

  Future notificationSelected(String payload) async {}
}
