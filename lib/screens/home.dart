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
  Set<TimeZone> _selectedTimeZones = {};
  List<Widget> _selectableViews = [];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;

    //TODO: load favorite time zones from data storage


//    _selectedTimeZones.add(tz1);
//    _selectedTimeZones.add(tz2);
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
