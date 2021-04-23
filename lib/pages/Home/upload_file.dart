import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class uploadFile extends StatefulWidget {
  @override
  _uploadFileState createState() => _uploadFileState();
}

class _uploadFileState extends State<uploadFile> {
  File _file;
  Map data;
  String description='';
  String message='';
  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();

  Future getFile()async{
    File file = await FilePicker.getFile();

    setState(() {
      _file = file;
    });
  }

  void _uploadFile(filePath) async {
    
    if(message.isEmpty || description.isEmpty){
      return _showSnackBarMsg('Please fill in all the data');
    }
    
    String fileName = basename(filePath.path);
    print("file base name:$fileName");

    try {
      FormData formData = new FormData.fromMap({
        "message": message,
        "description":description,
        "session": data['data'],
        "file": await MultipartFile.fromFile(filePath.path, filename: fileName),
      });

      Response response = await Dio().post("http://10.0.2.2:8000/auth/upload/",data: formData);
      print("File upload response: $response");
      _showSnackBarMsg('The file has been uploaded');
    } catch (e) {
      print("expectation Caugch: $e");
    }



  }
  void _showSnackBarMsg(String msg){
    _scaffoldstate.currentState
        .showSnackBar( new SnackBar(content: new Text(msg),));
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldstate,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Upload'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a description',
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'please enter the email to send password confirmation';
                }
              },

              onChanged: (text) {
                description = text;

              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a messgae',
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'please enter the email to send password confirmation';
                }
              },

              onChanged: (text) {
                message = text;

              },
            ),
            SizedBox(height: 20,),
            RaisedButton(
                child: Text("upload"),
                onPressed: (){
                  _uploadFile(_file);

                }),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getFile,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
