import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:intl/intl.dart';
import 'package:world_clock_app/models/timezone.dart';

class ClockCard extends StatefulWidget {
  TimeZone timezone;
  Function delete;

  ClockCard({this.timezone, this.delete});

  @override
  _ClockCardState createState() => _ClockCardState();
}

class _ClockCardState extends State<ClockCard> {
  DateTime date;

  @override
  Widget build(BuildContext context) {
    date = DateTime.parse(widget.timezone.datetime);

    return Card(
      child: Row(
        children: <Widget>[
          FlutterAnalogClock(
            dateTime: date,
            dialPlateColor: Colors.white,
            hourHandColor: Colors.black,
            minuteHandColor: Colors.black,
            secondHandColor: Colors.black,
            numberColor: Colors.black,
            borderColor: Colors.black,
            tickColor: Colors.black,
            centerPointColor: Colors.black,
            showBorder: true,
            showTicks: true,
            showMinuteHand: true,
            showSecondHand: true,
            showNumber: true,
            borderWidth: 5.0,
            hourNumberScale: .05,
            hourNumbers: [
              'I',
              'II',
              'III',
              'IV',
              'V',
              'VI',
              'VII',
              'VIII',
              'IX',
              'X',
              'XI',
              'XII'
            ],
            isLive: true,
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '${widget.timezone.timezone}',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${DateFormat('EEEE').format(date)}, ${date.day} ${DateFormat('MMM').format(date)}',
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton.icon(
                    onPressed: () => widget.delete(),
                    icon: Icon(Icons.delete),
                    label: Text(''))
              ],
            ),
          )
        ],
      ),
      elevation: 2,
    );
  }
}
