import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class Formscreen3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Formscreenstate();
  }
}

class Formscreenstate extends State<Formscreen3> {

  String first_name;
  String last_name;
  String username;
  String email;
  String password;
  String address;
  String gender;
  String contactno;
  String academiclevel;

  @override


  Future<void> registerStudent(String first_name, String last_name, String username,
      String email,
      String password,
      String address,
      String gender,
      String contactno,
      String academiclevel
      ) async{
      try{
//        Response res  = await post('http://10.0.2.2:8000/auth/register/',body:{
//
//        });

        final Response response = await post(
          'http://10.0.2.2:8000/auth/register/',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "first_name": first_name.trim(),
            "last_name": last_name.trim(),
            "username": username.trim(),
            "password": password,
            "address": address.trim(),
            "gender": gender.trim(),
            "contactno": contactno.trim(),
            "email": email.trim(),
            "academicLevel": academiclevel.trim()

          }),
        );

        Map data = jsonDecode(response.body);
        print(data);



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
        labelText: 'Enter first name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the name';
        }
      },
      onSaved: (String value) {
        first_name = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter last name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the name';
        }
      },
      onSaved: (String value) {
        last_name = value;
      },
    );
  }

  Widget buildUserNameField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter username',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter your username';
        }
      },
      onSaved: (String value) {
        username = value;
      },
    );
  }


  Widget buildaddressField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter address',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the address';
        }
      },
      onSaved: (String value) {
        address = value;
      },
    );
  }

  Widget buildemailField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter email',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the email';
        }
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter password',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the password';
        }
      },
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
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the gender';
        }
      },
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
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the contactno';
        }
      },
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
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the academiclevel';
        }
      },
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
            'Registration section for student',
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
                      buildUserNameField(),
                      SizedBox(height: 10),
                      buildPasswordField(),
                      SizedBox(height: 10),
                      buildemailField(),
                      SizedBox(height: 10),
                      buildaddressField(),
                      SizedBox(height: 10),
                      buildgenderField(),
                      SizedBox(height: 10),
                      buildcontactField(),
                      SizedBox(height: 10),
                      buildacademiclevelField(),
                      SizedBox(height: 10),
                      RaisedButton(
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.pink,
                        child: Text('Register'),
                        onPressed: () {
                          if (!formKey.currentState.validate()) {
                            return;
                          }
                        formKey.currentState.save();
                          registerStudent(first_name,last_name,username,email,password,address,gender
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
