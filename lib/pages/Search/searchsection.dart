import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _value = 'Maths';
  String value1 = "highschool";
  String values;

  Future<void> getTutors() async {
    try {
      // Making a request to django
      Response response =
          await get('http://10.0.2.2:8000/auth/search/?subject_name=$_value');
      // Decoding Json data.
      List data = jsonDecode(response.body);

      List filteredDate = data.where((element) => element['tutor_academic_level']==value1).toList();

      print('-----Filtered Date');
      print(filteredDate);
      print('-----Filtered Date');

      // Sending data to tutor lIst and re routing.
      Navigator.pushNamed(context, '/tutorList', arguments: {'data': data});
    } catch (Err) {
      print(Err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Search section',
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              SizedBox(height: 10),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Select subject',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.pink,
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              " Maths",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            value: 'Maths',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "Science",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            value: 'Science',
                          ),
                          DropdownMenuItem(
                              child: Text(
                                "English",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              value: 'English'),
                          DropdownMenuItem(
                              child: Text(
                                "Social",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              value: 'Social')
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        })),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Select academic level',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.pink,
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: value1,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              " Primary",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            value: 'primary',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "secondary",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                            value: 'secondary',
                          ),
                          DropdownMenuItem(
                              child: Text(
                                "Middleschool",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              value: 'middleschool'),
                          DropdownMenuItem(
                              child: Text(
                                "highschool",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              value: 'highschool'),
                          DropdownMenuItem(
                              child: Text(
                                "Bachelors",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              value: 'Bachelors')
                        ],
                        onChanged: (value) {
                          setState(() {
                            value1 = value;
                          });
                        })),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                  alignment: Alignment.center,
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.pink,
                    child: Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      getTutors();
                    },
                  )),
            ])));
  }
}
