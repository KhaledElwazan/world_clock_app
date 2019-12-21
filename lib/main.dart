import 'package:flutter/material.dart';
import 'package:world_clock_app/screens/home.dart';
import 'package:world_clock_app/screens/loading.dart';
import 'package:world_clock_app/screens/timezones.dart';

import 'screens/home.dart';

void main() => runApp(MaterialApp(
      initialRoute: "/",
  routes: {
    "/": (context) => Loading(),
    "/home": (context) => Home(),
    "/timezone_selector": (context) => TimeZonesSelector()
  },
    ));
