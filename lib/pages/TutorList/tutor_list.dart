import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Components/quotes_cards.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TutorList extends StatefulWidget {
  @override
  _TutorListState createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  Map data = {};

  // GET THE RATINGS FOR THE TUTOR
  Future<void> getTutorRating(id) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response = await get(
      'http://10.0.2.2:8000/auth/rating-list/$id/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    List data = jsonDecode(response.body);
    Navigator.pushNamed(context, '/tutorRating', arguments: {"data": data});
  }

  // GET THE INFO ABOUT THE TUTOR
  Future<void> getTutorDetails(id) async {
    Response response =
        await get('http://10.0.2.2:8000/auth/tutor-details/$id/');
    Map Tutor = jsonDecode(response.body);

    Navigator.pushNamed(context, '/tutorDetails', arguments: {'data': Tutor});
  }

  @override
  Widget build(BuildContext context) {
    // Catching the data that was sent.
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Tutor List'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: data['data']
                .map<Widget>((item) => Column(
                      children: <Widget>[
                        Card(
                          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  'Name : ${item['tutor_first_name']} ${item['tutor_last_name']}',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.grey[800]),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'Email : ${item['tutor_email']}',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[800]),
                                ),

                                // FlatButton.icon(
                                //     onPressed:(){

                                //       getTutorRating(item['tutor']);

                                //     },
                                //     label: Text('Tutor Ratings'),
                                //     icon: Icon(
                                //         Icons.star,
                                //         color:Colors.yellowAccent
                                //     )
                                // ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FlatButton.icon(
                                        onPressed: () {
                                          getTutorDetails(item['tutor']);
                                        },
                                        label: Text('Tutor Details'),
                                        icon: Icon(Icons.info)),
                                    FlatButton.icon(
                                        onPressed: () {
                                          print(item);
                                          Navigator.pushNamed(
                                              context, '/requestClass',
                                              arguments: {
                                                'id': item['tutor'],
                                                'subject_name':
                                                    item['subject_name'],
                                              });
                                        },
                                        label: Text('Make Request'),
                                        icon: Icon(Icons.chat)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ))
                .toList(),
          ),
        ));
  }
}
