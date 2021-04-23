import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadFiles extends StatefulWidget {
  @override
  _DownloadFilesState createState() => _DownloadFilesState();
}

class _DownloadFilesState extends State<DownloadFiles> {
  Map data = {};


  @override
  Widget build(BuildContext context) {
    data = ModalRoute
        .of(context)
        .settings
        .arguments;
    print(data);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('session'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: data['data']
                .map<Widget>((item) =>
                Column(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Description :${item['description']}',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.grey[800]),
                            ),
                            Text(
                              'Message : ${item['message']}',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.grey[800]),
                            ),
                            RaisedButton(
                              onPressed: ()=>{_launchURL(item['file'])},
                              child: Text('Download File'),
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

 Future<dynamic> _launchURL(file) async {
    String url = "http://10.0.2.2:8000$file";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
