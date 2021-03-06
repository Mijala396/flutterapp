import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tutor/AddSubject/add_subject.dart';
import 'package:flutter_application_1/Tutor/ManageSubjects/manage_subjects.dart';
import 'package:flutter_application_1/Tutor/Profile/edit_tutor.dart';
import 'package:flutter_application_1/Tutor/Profile/tutor_profile.dart';
import 'package:flutter_application_1/Tutor/TutorClass/class_request.dart';
import 'package:flutter_application_1/Tutor/TutorClass/tutor_class.dart';
import 'package:flutter_application_1/Tutor/Home/homepage_tutor.dart';
import 'package:flutter_application_1/Tutor/notification/tutor_notification.dart';
import 'package:flutter_application_1/pages/Home/homepage_student.dart';
import 'package:flutter_application_1/pages/Home/upload_file.dart';
import 'package:flutter_application_1/pages/Notification/notification.dart';
import 'package:flutter_application_1/pages/Profile/edit_student.dart';
import 'package:flutter_application_1/pages/Login/newlogins.dart';
import 'package:flutter_application_1/pages/Profile/student_profile.dart';
import 'package:flutter_application_1/pages/RequestClass/download_file.dart';
import 'package:flutter_application_1/pages/RequestClass/request_class.dart';
import 'package:flutter_application_1/pages/RequestClass/student_bill.dart';
import 'package:flutter_application_1/pages/TutorDetails/tutor_details.dart';
import 'package:flutter_application_1/pages/TutorList/tutor_list.dart';
import 'package:flutter_application_1/pages/TutorRating/tutor_ratings.dart';
import 'package:flutter_application_1/pages/RequestClass/view_class.dart';
import 'package:flutter_application_1/pages/student_class_history/student_classHistory.dart';
import 'package:flutter_application_1/Tutor/tutor_class_history/tutor_classhistory.dart';
import 'package:flutter_application_1/pages/student_class_history/rate_tutors.dart';
import 'package:flutter_application_1/pages/forgetpw/forgetpw.dart';
import 'package:flutter_application_1/pages/forgetpw/resetpw.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Formscreen(),
        '/profile': (context) => StudentProfile(),
        '/edit': (context) => StudentProfileEdit(),
        '/tutorList': (context) => TutorList(),
        '/tutorDetails': (context) => TutorDetails(),
        '/tutorRating': (context) => TutorRating(),
        '/requestClass': (context) => RequestClass(),
        '/tutorHome': (context) => TutorHome(),
        '/tutorProfile': (context) => TutorProfile(),
        '/addSubject': (context) => AddSubject(),
        '/manageSubjects': (context) => ManageSubjects(),
        '/tutorEdit': (context) => TutorEdit(),
        '/tutorClass': (context) => TutorClass(),
        '/tutorClassRequest': (context) => TutorClassRequest(),
        '/studentclassview': (context) => StudentClass(),
        '/StudentHome': (context) => StudentHome(),
        '/StudentNotification': (context) => StudentNotification(),
        '/studentBill': (context) => studentBill(),
        '/studentclasshistory': (context) => studentClassHistory(),
        '/tutorclasshistory': (context) => tutorClassHistory(),
        '/tutorrating': (context) => Rating(),
        '/forgotpassword': (context) => ForgetPassword(),
        '/resetPassword': (context) => ResetPassword(),
        '/tutorNotification':(context)=> tutorNotification(),
        '/uploadFile':(context)=> uploadFile(),
        '/downloadFile':(context)=> DownloadFiles(),
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
