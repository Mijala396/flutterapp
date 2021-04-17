import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login_Screen.dart';
import 'package:flutter_application_1/pages/Search/Searchsection.dart';
import 'package:flutter_application_1/pages/Profile/student_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
class StudentHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Student Homepage',
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
                        Navigator.pushNamed(context, '/profile');
                        //signup screen
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
                        'Search Tutor',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Search()),
                        ); //signup screen
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
                        Navigator.pushNamed(context, '/studentclassview');
                        //view class screen
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
                        Fluttertoast.showToast(
                            msg: "Sucessfully Logged Out ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.pink,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        Navigator.pushReplacementNamed(context, '/');
                      },
                    )),
              ],
            )));
  }
}
