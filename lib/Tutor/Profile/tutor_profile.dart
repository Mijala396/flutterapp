import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class TutorProfile extends StatefulWidget {
  @override
  _TutorProfileState createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String number = '';
  String address = '';
  String educationalInstitute = '';
  String academicleveltoteach = '';
  int chargePerHour;
  List subjects;
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
      educationalInstitute = data[0]['educationalInstitute'];
      number = data[0]['contactno'];
      academicleveltoteach = data[0]['academicleveltoteach'];
      address = data[0]['address'];
      chargePerHour = data[0]['chargePerHour'];
      subjects = data[0]['subjects'];
    });
    print(data);
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Profile Page'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0,
        ),
        floatingActionButton: SpeedDial(
          overlayOpacity: 0,
          backgroundColor: Colors.pink,
          foregroundColor: Colors.pinkAccent,
          closeManually: true,
          elevation: 8,
          children: [
            SpeedDialChild(
                child: Icon(Icons.edit),
                label: "Edit Profile",
                onTap: () {
                  Navigator.pushNamed(context, '/tutorEdit');
                }),
            SpeedDialChild(
                child: Icon(Icons.book),
                label: "Add Subject",
                onTap: () {
                  Navigator.pushNamed(context, '/addSubject');
                }),
            SpeedDialChild(
                child: Icon(Icons.menu),
                label: "Manage Subjects",
                onTap: () {
                  Navigator.pushNamed(context, '/manageSubjects',
                      arguments: {'subjects': subjects});
                }),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i1.wp.com/recommendmeanime.com/wp-content/uploads/2017/01/best-anime-teachers.jpg?fit=1360%2C768&ssl=1'),
                  radius: 40.0,
                ),
              ),
              Divider(
                height: 90,
                color: Colors.red[900],
              ),
              Text(
                'Name',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$firstName $lastName',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Teacher for',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$academicleveltoteach',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Graduated From',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$educationalInstitute',
                style: TextStyle(
                  color: Colors.white,
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
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$email',
                    style: TextStyle(
                      color: Colors.white,
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
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$number',
                    style: TextStyle(
                      color: Colors.white,
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
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$address',
                    style: TextStyle(
                      color: Colors.grey[400],
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
                    Icons.monetization_on,
                    color: Colors.green[400],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$chargePerHour per hour',
                    style: TextStyle(
                      color: Colors.white,
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
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Currently Active',
                    style: TextStyle(
                      color: Colors.white,
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
