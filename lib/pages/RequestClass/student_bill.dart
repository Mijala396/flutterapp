import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_khalti/flutter_khalti.dart';
import 'package:fluttertoast/fluttertoast.dart';

class studentBill extends StatefulWidget {
  @override
  _studentBillState createState() => _studentBillState();
}

class _studentBillState extends State<studentBill> {
  Map data;
  Map billdata = {};

  _payViaKhalti() async {
    FlutterKhalti _flutterKhalti = FlutterKhalti.configure(
      publicKey: "test_public_key_c0c245c7588a46149e8875419d7c3895",
      urlSchemeIOS: "KhaltiPayFlutterExampleScheme",
      paymentPreferences: [
        KhaltiPaymentPreference.KHALTI,
      ],
    );

    KhaltiProduct product = KhaltiProduct(
      id: "test",
      amount: double.parse((billdata['session_cost'] * 100).toString()),
      name: "TutorSession",
    );
    _flutterKhalti.startPayment(
      product: product,
      onSuccess: (data) {
        print("here");
        updateBillStatus();
        Fluttertoast.showToast(
            msg: "Payment Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.pink,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pushReplacementNamed(context, '/studentclassview');
      },
      onFaliure: (error) {
        print("sorry");
        Fluttertoast.showToast(
            msg: "Payment Error! Please try again.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.pink,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pushReplacementNamed(context, '/studentclassview');
      },
    );
  }

  Future<void> updateBillStatus() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response = await patch(
      'http://10.0.2.2:8000/auth/UpdateBillPaidStatus/${billdata['id']}/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
  }

  Future<void> getbilldata() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');

    final Response response = await get(
      'http://10.0.2.2:8000/auth/studentclassbills/${data['id']}/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    try {
      setState(() {
        billdata = jsonDecode(response.body);
      });

      print(billdata);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getbilldata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('student bill'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Card(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Student : ${data['student_name']} ${data['student_lastname']}',
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Tutor : ${data['tutor_name']} ${data['tutor_lastname']}',
                        style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Tutor charge per hour : ${data['tutor_chargePerHour']} ',
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Session Cost: ${billdata['session_cost']}',
                        style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: billdata['is_paid']
                                ? Text('bill is paid')
                                : FlatButton.icon(
                                    onPressed: () {
                                      _payViaKhalti();
                                    },
                                    label: Text('pay bill'),
                                    icon: Icon(Icons.monetization_on)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}
