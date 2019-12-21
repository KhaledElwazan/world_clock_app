import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_clock_app/models/timezone.dart';
import 'package:world_clock_app/views/clock_view.dart';
import 'package:world_clock_app/views/timezone_List_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime date;
  int _currentIndex;

  List<String> _allTimeZones = [];
  List<TimeZone> _selectedTimeZones = [];
  List<Widget> _selectableViews = [];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;


    //TODO: load favorite time zones from data storage
    TimeZone tz1 = TimeZone.fromJson({
      "week_number": 51,
      "utc_offset": "+00:00",
      "utc_datetime": "2019-12-20T12:44:40.547737+00:00",
      "unixtime": 1576845880,
      "timezone": "Africa/Abidjan",
      "raw_offset": 0,
      "dst_until": null,
      "dst_offset": 0,
      "dst_from": null,
      "dst": false,
      "day_of_year": 354,
      "day_of_week": 5,
      "datetime": "2019-12-20T12:44:40.547737+00:00",
      "client_ip": "197.48.96.78",
      "abbreviation": "GMT"
    });

    TimeZone tz2 = TimeZone.fromJson({
      "week_number": 51,
      "utc_offset": "+00:00",
      "utc_datetime": "2019-12-20T12:44:40.547737+00:00",
      "unixtime": 1576845880,
      "timezone": "Africa/Abidjan",
      "raw_offset": 0,
      "dst_until": null,
      "dst_offset": 0,
      "dst_from": null,
      "dst": false,
      "day_of_year": 354,
      "day_of_week": 5,
      "datetime": "2019-12-20T12:44:40.547737+00:00",
      "client_ip": "197.48.96.78",
      "abbreviation": "GMT"
    });

    _selectedTimeZones.add(tz1);
    _selectedTimeZones.add(tz2);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    date = DateTime.now();

    Map arguments = ModalRoute.of(context).settings.arguments;
    _allTimeZones = arguments['timezones'];

    _selectableViews.add(ClockView(
      addTimeZone: () {
        setState(() {
          _currentIndex = 1;
        });
      },
    ));
    _selectableViews.add(TimeZonesList(
      selectedTimeZones: _selectedTimeZones,
      allTimeZones: _allTimeZones,
    ));

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            title: Text('Clock'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
        ],
      ),
      body: SafeArea(
        child: _selectableViews[_currentIndex],
      ),
    );
  }
}
