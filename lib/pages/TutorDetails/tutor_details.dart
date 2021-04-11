import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class TutorDetails extends StatefulWidget {
  @override
  _TutorDetailsState createState() => _TutorDetailsState();
}

class _TutorDetailsState extends State<TutorDetails> {
  Map data={};
  Map Tutor={};


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    Tutor = data['data'];
    print(Tutor['subjects']);
    return  Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Profile Page'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0,
        ),
        body:Padding(
          padding: EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://i1.wp.com/recommendmeanime.com/wp-content/uploads/2017/01/best-anime-teachers.jpg?fit=1360%2C768&ssl=1'),
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
                    color:Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10,),

                Text(
                  '${Tutor['first_name']} ${Tutor['last_name']}',
                  style: TextStyle(
                    color:Colors.amber[200],
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Teacher For',
                  style: TextStyle(
                    color:Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10,),



                Text(
                  '${Tutor['academicleveltoteach']}',
                  style: TextStyle(
                    color:Colors.amber[200],
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.grey[400],
                    ),
                    SizedBox(width: 10,),
                    Text(
                      '${Tutor['email']}',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18.0,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.grey[400],
                    ),
                    SizedBox(width: 10,),
                    Text(
                      '${Tutor['contactno']}',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18.0,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_city,
                      color: Colors.grey[400],
                    ),
                    SizedBox(width: 10,),
                    Text(
                      '${Tutor['address']}',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18.0,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.monetization_on,
                      color: Colors.green[400],
                    ),
                    SizedBox(width: 10,),
                    Text(
                      '${Tutor['chargePerHour']} per hour',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18.0,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      color: Colors.green[400],
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Currently Active',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18.0,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text(
                  'Subjects',
                  style: TextStyle(
                    color:Colors.amber[200],
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                Column(
                  children: Tutor['subjects'].map<Widget>((item)=>Column(
                    children: <Widget>[
                      Text(
                        '${item['subject_name']}',
                        style: TextStyle(
                            color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    ],
                  )).toList(),
                )


              ],
            ),
          ),

        )
    );
  }
}
