import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_clock_app/models/timezone.dart';

import 'cards.dart';

class TimeZonesList extends StatefulWidget {
  Set<TimeZone> selectedTimeZones = {};
  List<String> allTimeZones = [];
  final String _base_url = 'http://worldtimeapi.org/api/timezone/';

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
            onPressed: () async {
              final index = await Navigator.pushNamed(
                  context, "/timezone_selector",
                  arguments: {"timezones": widget.allTimeZones});

              if (index == null)
                print('nul!');
              else {
                Response response = await get(
                    '${widget._base_url}/${widget.allTimeZones[index]}');
                Map _json = json.decode(response.body);
                TimeZone timeZone = TimeZone.fromJson(_json);
                if (widget.selectedTimeZones.lookup(timeZone) == null)
                  setState(() {
                    widget.selectedTimeZones.add(timeZone);
                  });
              }
            },
          )
        ],
      ),
    );
  }
}
