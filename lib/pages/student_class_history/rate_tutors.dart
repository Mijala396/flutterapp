import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/services.dart';

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  Map data = {};
  String review = " ";
  String _rate;

  Future<void> submit() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response =
        await post('http://10.0.2.2:8000/auth/rating-list/${data['id']}/',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': "Bearer $token"
            },
            body: jsonEncode(<String, dynamic>{
              "tutor_review": review,
              "tutor": data['id'],
              "tutor_ratings": _rate,
            }));
    Fluttertoast.showToast(
        msg: "Sucessfully submitted review",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.pink,
        textColor: Colors.white,
        fontSize: 16.0);

    Navigator.pushReplacementNamed(context, '/studentclasshistory');
  }

  Widget buildratingField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-5]')),
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter your ratings in number',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the rating.';
        }
      },
      onSaved: (String value) {
        _rate = value;
      },
      onChanged: (String value) {
        _rate = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Tutor'),
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
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              buildratingField(),
              SizedBox(
                height: 10,
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Write a review'),
                onChanged: (text) {
                  review = text;
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
                  'Submit review',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                onPressed: () {
                  submit();
                  Fluttertoast.showToast(
                      msg: "Request sent successfully!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.pink,
                      textColor: Colors.white,
                      fontSize: 16.0);

                  Navigator.pushReplacementNamed(
                      context, '/studentclasshistory');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
