import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tutor/Profile/tutor_profile.dart';
import 'file:///E:/Andriod%20Projetcs/Fyp/flutterapp/lib/Tutor/Home/homepage_tutor.dart';
import 'package:flutter_application_1/pages/Profile/edit_student.dart';
import 'file:///E:/Andriod%20Projetcs/Fyp/flutterapp/lib/pages/Login/newlogins.dart';
import 'package:flutter_application_1/pages/Profile/student_profile.dart';
import 'package:flutter_application_1/pages/RequestClass/request_class.dart';
import 'package:flutter_application_1/pages/TutorDetails/tutor_details.dart';
import 'package:flutter_application_1/pages/TutorList/tutor_list.dart';
import 'package:flutter_application_1/pages/TutorRating/tutor_ratings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>Formscreen(),
        '/profile':(context)=>StudentProfile(),
        '/edit':(context)=>StudentProfileEdit(),
        '/tutorList':(context)=> TutorList(),
        '/tutorDetails':(context)=> TutorDetails(),
        '/tutorRating':(context)=>TutorRating(),
        '/requestClass': (context)=> RequestClass(),
        '/tutorHome' : (context)=>TutorHome(),
        '/tutorProfile':(context)=> TutorProfile(),

      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Application',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}