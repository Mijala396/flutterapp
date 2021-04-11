import 'package:flutter/material.dart';

class RequestClass extends StatefulWidget {
  @override
  _RequestClassState createState() => _RequestClassState();
}

class _RequestClassState extends State<RequestClass> {
  Map data = {};
  DateTime _startDateTime;
  DateTime _endDateTime;
  TimeOfDay _time;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      appBar: AppBar(
        title:Text('Class Request'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text('Start Date'),
                    onPressed: (){
                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(),
                          lastDate: DateTime(2022)).then((date){
                        setState(() {
                          _startDateTime = date;
                        });
                      }
                      );
                    },
                  ),
                  SizedBox(width: 10,),
                  Text(_startDateTime == null ?'Not picked a start date Yet': _startDateTime.toString()),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text('End Date'),
                    onPressed: (){
                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(),
                          lastDate: DateTime(2022)).then((date){
                        setState(() {
                          _endDateTime = date;
                        });
                      }
                      );
                    },
                  ),
                  SizedBox(width: 10,),
                  Text(_endDateTime == null ?'Not picked a start date Yet': _endDateTime.toString()),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text('Start Time'),
                    onPressed: (){
                        showTimePicker(context: context, initialTime: TimeOfDay.now(),).then((date){
                        setState(() {
                          _time = date;
                        });
                      }
                      );
                    },
                  ),
                  SizedBox(width: 10,),
                  Text(_time == null ?'Not picked a start time yet': _time.toString()),

                ],
              ),
            ),

            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Send a message'
              ),
            ),
            SizedBox(height: 30,),
            RaisedButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.pink,
              child: Text(
                'Send Request',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              onPressed: () {
              },

            ),

          ],
        ),
      ),
    );
  }
}
