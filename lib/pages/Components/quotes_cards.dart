import 'package:flutter/material.dart';


class quoteCard extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16,16,16,0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Title',
              style: TextStyle(
                  fontSize: 18.0,
                  color:Colors.grey[800]
              ),
            ),
            SizedBox(height: 8.0,),
            Text(
              'Tutor',
              style: TextStyle(
                  fontSize: 18,
                  color:Colors.grey[800]
              ),
            ),
            SizedBox(height: 8.0,),
            FlatButton.icon(
              onPressed:(){},
              label: Text('delete quote'),
              icon: Icon(Icons.delete)
            )
          ],
        ),
      ),
    );
  }
}
