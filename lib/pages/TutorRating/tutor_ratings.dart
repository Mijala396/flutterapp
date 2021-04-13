import 'package:flutter/material.dart';

class TutorRating extends StatefulWidget {
  @override
  _TutorRatingState createState() => _TutorRatingState();
}

class _TutorRatingState extends State<TutorRating> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      appBar: AppBar(
        title:Text('Tutor List'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: data['data'].map<Widget>((item)=>Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(16,16,16,0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Rating : ${item['tutor_ratings']}/5',
                      style: TextStyle(
                          fontSize: 18.0,
                          color:Colors.grey[800]
                      ),
                    ),
                    SizedBox(height: 8.0,),
                    Text(
                      'Review : ${item['tutor_review']}',
                      style: TextStyle(
                          fontSize: 18,
                          color:Colors.grey[800]
                      ),
                    ),
                    SizedBox(height: 8.0,),
                  ],
                ),
              ),
            )
          ],
        )).toList(),
      )
    );
  }
}
