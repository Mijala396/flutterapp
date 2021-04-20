import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/services.dart';

class RequestClass extends StatefulWidget {
  @override
  _RequestClassState createState() => _RequestClassState();
}

class _RequestClassState extends State<RequestClass> {
  Map data = {};
  DateTime _startDateTime;
  TimeOfDay _time;
  String message;
  String _sessionDuration;
  String _sessiondays;

  Future<void> sendRequest() async {
    String dateString = _startDateTime.toString();
    print(dateString);
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response =
        await post('http://10.0.2.2:8000/auth/request-session/',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': "Bearer $token"
            },
            body: jsonEncode(<String, dynamic>{
              "subject": data['subject_name'],
              "tutor": data['id'],
              "session_date": dateString,
              "session_time": _time.toString(),
              "session_duration": _sessionDuration,
              "session_days": _sessiondays,
              "message": message
            }));
    Fluttertoast.showToast(
        msg: "Sucessfully Sent a Request ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.pink,
        textColor: Colors.white,
        fontSize: 16.0);

    Navigator.pushReplacementNamed(context, '/StudentHome');
  }

  Widget buildsessionDurationField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Session Duration(hour per day)',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the number of days.';
        }
      },
      onSaved: (String value) {
        _sessionDuration = value;
      },
      onChanged: (String value) {
        _sessionDuration = value;
      },
    );
  }

  Widget buildsessionDayField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Session days',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter number of days.';
        }
      },
      onSaved: (String value) {
        _sessiondays = value;
      },
      onChanged: (String value) {
        _sessiondays = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Request'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Start Date'),
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            onChanged: (date) {}, onConfirm: (date) {
                          _startDateTime = date;
                          print('Current $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(_startDateTime == null
                        ? 'Not picked a start date Yet'
                        : _startDateTime.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Start Time'),
                      onPressed: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((date) {
                          setState(() {
                            _time = date;
                          });
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(_time == null
                        ? 'Not picked a start time yet'
                        : _time.toString()),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buildsessionDurationField(),
              SizedBox(
                height: 10,
              ),
              buildsessionDayField(),
              TextField(
                maxLines: 4,
                decoration:
                    InputDecoration(labelText: 'Send a message(optional)'),
                onChanged: (text) {
                  message = text;
                  print(text);
                },
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.pink,
                child: Text(
                  'Send Request',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                onPressed: () {
                  sendRequest();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
