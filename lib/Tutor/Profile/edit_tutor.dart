import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TutorEdit extends StatefulWidget {
  @override
  _TutorEditState createState() => _TutorEditState();
}

class _TutorEditState extends State<TutorEdit> {
  String first_name='';
  String last_name='';
  String username;
  String email='';
  String password;
  String address;
  String gender='';
  String contactno='';
  String academiclevel;
  String chargePerHour='';

  @override


  Future<void> updateStudent(String first_name, String last_name, String username,
      String email,
      String password,
      String address,
      String gender,
      String contactno,
      String academiclevel
      ) async{


    try{
      var editableData = new Map();

      print(first_name.isEmpty);
      if(first_name.isNotEmpty)editableData['first_name']=first_name;
      if(last_name.isNotEmpty) editableData['last_name']=last_name;
      if(email.isNotEmpty) editableData['email']=email;
      if(address.isNotEmpty) editableData['address']=address;
      if(contactno.isNotEmpty)editableData['contactno']= contactno;
      if(chargePerHour.isNotEmpty)editableData['chargePerHour']= chargePerHour;
      print(editableData);
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');

      final Response response = await patch(
        'http://10.0.2.2:8000/auth/getUsers/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':"Bearer $token"
        },
        body: jsonEncode(editableData),
      );

      Map data = jsonDecode(response.body);

      Fluttertoast.showToast(
          msg: "Edit Sucessful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushReplacementNamed(context, '/profile');




    }

    catch(err){
      print(err);
    }
  }


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Edit first name',
      ),
      onSaved: (String value) {
        first_name = value;
      },
    );
  }

  Widget buildChargePerHourField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Edit charge per hour',
      ),
      onSaved: (String value) {
        chargePerHour = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Edit last name',
      ),
      onSaved: (String value) {
        last_name = value;
      },
    );
  }

  Widget buildUserNameField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Edit username',
      ),
      onSaved: (String value) {
        username = value;
      },
    );
  }


  Widget buildaddressField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Edit address',
      ),
      onSaved: (String value) {
        address = value;
      },
    );
  }

  Widget buildemailField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Edit email',
      ),
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Edit password',
      ),
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget buildgenderField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter gender',
      ),
      onSaved: (String value) {
        gender = value;
      },
    );
  }

  Widget buildcontactField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter contactno',
      ),
      onSaved: (String value) {
        contactno = value;
      },
    );
  }

  Widget buildacademiclevelField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter academiclevel',
      ),
      onSaved: (String value) {
        academiclevel = value;
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit your profile',
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Container(
                margin: EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildFirstNameField(),
                      SizedBox(height: 10),
                      buildLastNameField(),
                      SizedBox(height: 10),
                      buildaddressField(),
                      SizedBox(height: 10),
                      buildgenderField(),
                      SizedBox(height: 10),
                      buildcontactField(),
                      SizedBox(height: 10),
                      buildChargePerHourField(),
                      SizedBox(height: 10),
                      RaisedButton(
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.pink,
                        child: Text('Edit'),
                        onPressed: () {
                          if (!formKey.currentState.validate()) {
                            return;
                          }
                          formKey.currentState.save();
                          updateStudent(first_name,last_name,username,email,password,address,gender
                              ,contactno,academiclevel);

                        },
                      )
                    ],
                  ),
                ),
              ),
            ])));
  }
}
