import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class ManageSubjects extends StatefulWidget {
  @override
  _ManageSubjectsState createState() => _ManageSubjectsState();
}

class _ManageSubjectsState extends State<ManageSubjects> {
  Map data= {};
  Future<void> deleteSubject(id)async{
      try{
        Response response = await delete('http://10.0.2.2:8000/auth/delete-subject/$id/');
        Navigator.pushNamed(context, '/tutorProfile');
      }
      catch(err){
        print(err);
      }
  }
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:Text('Manage Subjects'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: data['subjects'].map<Widget>((item)=>Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(16,16,16,0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      '${item['subject_name']}'
                    ),
                    FlatButton.icon(
                        onPressed:(){
                              deleteSubject(item['id']);
                        },
                        label: Text('Remove Subject'),
                        icon: Icon(
                            Icons.remove,
                            color:Colors.redAccent,
                        )
                    )
                  ],
                ) ,
              ),
            )
          ],
        )).toList()
      ),
    );
  }
}
