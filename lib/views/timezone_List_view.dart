import 'package:flutter/material.dart';
import 'package:world_clock_app/models/timezone.dart';

import 'cards.dart';

class TimeZonesList extends StatefulWidget {
  List<TimeZone> selectedTimeZones = [];
  List<String> allTimeZones = [];

  TimeZonesList({this.selectedTimeZones, this.allTimeZones});

  @override
  _TimeZonesListState createState() => _TimeZonesListState();
}

class _TimeZonesListState extends State<TimeZonesList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: widget.selectedTimeZones
                  .map((timezone) => ClockCard(
                        timezone: timezone,
                        delete: () {
                          setState(() {
                            widget.selectedTimeZones.remove(timezone);
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, "/timezone_selector",
                  arguments: {"timezones": widget.allTimeZones});
            },
          )
        ],
      ),
    );
  }
}
