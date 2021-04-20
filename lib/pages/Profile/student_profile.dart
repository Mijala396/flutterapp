import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StudentProfile extends StatefulWidget {
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String level = '';
  String number = '';
  String address = '';

  Future<void> getUserInfo() async {
    // Pulling Data from SharedPreferences.

    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response = await get(
      'http://10.0.2.2:8000/auth/getUsers/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    List data = jsonDecode(response.body);
    setState(() {
      firstName = data[0]['first_name'];
      lastName = data[0]['last_name'];
      email = data[0]['email'];
      level = data[0]['academicLevel'];
      number = data[0]['contactno'];
      address = data[0]['address'];
    });
  }

  @override
  void initState() {
    getUserInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Profile Page'),
          centerTitle: true,
          backgroundColor: Colors.pink,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/edit');
          },
          child: const Icon(Icons.edit),
          backgroundColor: Colors.pink,
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/d9/56/9b/d9569bbed4393e2ceb1af7ba64fdf86a.jpg'),
                  radius: 40.0,
                ),
              ),
              Text(
                'Name',
                style: TextStyle(
                  color: Colors.grey[800],
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$firstName $lastName',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Current Level',
                style: TextStyle(
                  color: Colors.grey[800],
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$level',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$email',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18.0,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$number',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18.0,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_city,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$address',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18.0,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    color: Colors.green[400],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Currently Active',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18.0,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
