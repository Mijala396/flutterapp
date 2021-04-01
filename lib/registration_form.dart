import 'package:flutter/material.dart';

class Formscreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Formscreenstate();
  }
}

class Formscreenstate extends State<Formscreen2> {
  String name;
  String email;
  String password;
  String address;
  String gender;
  String contactno;
  String chargeperhour;
  String qualification;
  String educationalinstitute;
  String academicleveltoteach;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget buildUNameField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the name';
        }
      },
      onSaved: (String value) {
        password = value;
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

  Widget buildchargeperhourField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter chargeperhour',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the chargeperhour';
        }
      },
      onSaved: (String value) {
        chargeperhour = value;
      },
    );
  }

  Widget buildqualificationField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter qualification',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the qualification';
        }
      },
      onSaved: (String value) {
        qualification = value;
      },
    );
  }

  Widget buildeducationalinstituteField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter educationalinstitute',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the educationalinstitute';
        }
      },
      onSaved: (String value) {
        educationalinstitute = value;
      },
    );
  }

  Widget buildacademicleveltoteachField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter academicleveltoteach',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please enter the academicleveltoteach';
        }
      },
      onSaved: (String value) {
        academicleveltoteach = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Registration section for tutor',
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
                      buildUNameField(),
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
                      buildchargeperhourField(),
                      SizedBox(height: 10),
                      buildqualificationField(),
                      SizedBox(height: 10),
                      buildeducationalinstituteField(),
                      SizedBox(height: 10),
                      buildacademicleveltoteachField(),
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
                        },
                      )
                    ],
                  ),
                ),
              ),
            ])));
  }
}
