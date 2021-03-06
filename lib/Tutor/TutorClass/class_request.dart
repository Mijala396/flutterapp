import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class TutorClassRequest extends StatefulWidget {
  @override
  _TutorClassRequestState createState() => _TutorClassRequestState();
}

class _TutorClassRequestState extends State<TutorClassRequest> {
  List sessions = [];
  int totalcost;
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

  Future<void> updateStatus(id,student) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response = await patch(
      'http://10.0.2.2:8000/auth/approve-status/$id/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    final Response response1 = await post(
      'http://10.0.2.2:8000/auth/bill/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "Payment_type": "Online",
        "session_cost": totalcost,
        "seession": id,
        "bill_date": "today"
      }),
    );

    final Response response2 = await post(
        'http://10.0.2.2:8000/auth/notifications/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        }, body: jsonEncode(<String, dynamic>{
      "notification": 'Your class request has been accepted',
      "recepient": student,
      "seession":id
    })
    );

  }

  void calculateCost(duration, day, charge) {
    totalcost = duration * day * charge;
  }

  Future<void> deletestatus(id,student) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response2 = await post(
        'http://10.0.2.2:8000/auth/notifications/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        }, body: jsonEncode(<String, dynamic>{
      "notification": 'You have a new class request',
      "recepient": student,
    })
    );


    final Response response = await delete(
      'http://10.0.2.2:8000/auth/deleteSessionRequest/$id/',
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
                                  'StudentName : ${item['student_name']} ${item['student_lastname']}',
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
                                  'duration in hours : ${item['session_duration']} ',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.grey[800]),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'duration in days : ${item['session_days']} ',
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
                                          calculateCost(
                                              item["session_duration"],
                                              item["session_days"],
                                              item["tutor_chargePerHour"]);
                                          updateStatus(item["id"],item['student']);
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Session accepted successfully",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIos: 1,
                                              backgroundColor: Colors.pink,
                                              textColor: Colors.white,
                                              fontSize: 16.0);

                                          Navigator.pushReplacementNamed(
                                              context, '/tutorClassRequest');
                                        },
                                        label: Text('Accept request'),
                                        icon: Icon(Icons.info)),
                                    FlatButton.icon(
                                        onPressed: () {
                                          deletestatus(item['id'],item['student']);
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Request cancelled successfully",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIos: 1,
                                              backgroundColor: Colors.pink,
                                              textColor: Colors.white,
                                              fontSize: 16.0);

                                          Navigator.pushReplacementNamed(
                                              context, '/tutorClassRequest');
                                        },
                                        label: Text('Delete request'),
                                        icon: Icon(Icons.delete)),
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
