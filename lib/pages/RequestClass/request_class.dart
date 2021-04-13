import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> sendRequest() async{
        String dateString = _startDateTime.toString();
        print(dateString);
        final pref = await SharedPreferences.getInstance();
        final token = pref.getString('token');

        final Response response = await post(
            'http://10.0.2.2:8000/auth/request-session/',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization':"Bearer $token"
            },
            body:jsonEncode(<String, dynamic>{
              "subject": data['subject_name'],
              "tutor":data['id'],
              "session_date":dateString,
              "session_time":_time.toString(),
              "session_duration":_sessionDuration,
              "message":message
            }
            )
        );

        Navigator.pushReplacementNamed(context, '/tutorHome');

  }



  Widget buildsessionDurationField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Session Duration',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the name';
        }
      },
      onSaved: (String value) {
        _sessionDuration = value;
      },
      onChanged: (String value){
        _sessionDuration = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title:Text('Class Request'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
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
                      onPressed: (){
                        showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(),
                            lastDate: DateTime(2022)).then((date){
                          setState(() {
                            _startDateTime = date;
                          });
                        }
                        );
                      },
                    ),
                    SizedBox(width: 10,),
                    Text(_startDateTime == null ?'Not picked a start date Yet': _startDateTime.toString()),

                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Start Time'),
                      onPressed: (){
                          showTimePicker(context: context, initialTime: TimeOfDay.now(),).then((date){
                          setState(() {
                            _time = date;
                          });
                        }
                        );
                      },
                    ),
                    SizedBox(width: 10,),
                    Text(_time == null ?'Not picked a start time yet': _time.toString()),

                  ],
                ),
              ),

              SizedBox(height: 10,),
              buildsessionDurationField(),

              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Send a message'
                ),
                onChanged: (text){
                  message = text;
                  print(text);

                },
              ),
              SizedBox(height: 30,),
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
