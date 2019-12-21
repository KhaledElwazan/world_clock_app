import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<String> timeZones = [];

  loadTimeZones() async {
    Response response = await get('http://worldtimeapi.org/api/timezone.txt');
    timeZones = response.body.split('\n');

    Navigator.pushReplacementNamed(context, "/home",
        arguments: {"timezones": timeZones});
  }

  @override
  Widget build(BuildContext context) {

    loadTimeZones();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SpinKitRotatingPlain(
            color: Colors.black,
            size: 80.0,
          ),
        ));
  }
}
