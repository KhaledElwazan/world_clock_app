import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_clock_app/models/timezone.dart';

import '../db/app_db.dart';
import 'home.dart';

class Loading extends StatefulWidget {
  static const routeName = '/loading';

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<String> timeZones = [];

  loadTimeZones() async {
    Response response = await get('http://worldtimeapi.org/api/timezone.txt');
    timeZones = response.body.split('\n');

    // load saved timezones
    final database =
    await $FloorAppDatabase.databaseBuilder(AppDatabase.DB_NAME).build();

    List<TimeZone> _selectedTimeZones =
    await database.timezoneDao.findAllTimeZones();


    _selectedTimeZones.forEach((val) {
      print(val);
    });

    Navigator.pushReplacementNamed(context, Home.routeName, arguments: {
      "timezones": timeZones,
      "selectedTimeZones": _selectedTimeZones
    });
  }

  @override
  void initState() {
    super.initState();
    loadTimeZones();
  }

  @override
  Widget build(BuildContext context) {
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
