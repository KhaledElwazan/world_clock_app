import 'package:flutter/material.dart';
import 'package:world_clock_app/screens/loading.dart';
import 'package:world_clock_app/screens/timezones.dart';

import 'screens/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: Loading.routeName,
  routes: {
    Loading.routeName: (context) => Loading(),
    TimeZonesSelector.routeName: (context) => TimeZonesSelector(),
    Home.routeName: (context) => Home(),
  },
    ));
