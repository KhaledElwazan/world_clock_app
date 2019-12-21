import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:intl/intl.dart';

class ClockView extends StatefulWidget {
  Function addTimeZone;

  ClockView({this.addTimeZone});

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  DateTime date;

  @override
  Widget build(BuildContext context) {
    date = DateTime.now();

    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlutterAnalogClock(
              dateTime: DateTime.now(),
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
              borderWidth: 8.0,
              hourNumberScale: .10,
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
              width: 200.0,
              height: 200.0,
              decoration: const BoxDecoration(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            ' ${DateFormat('EEEE').format(date)},  ${date.day} ${DateFormat('MMM').format(date)}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 50,
          ),
          FlatButton.icon(
              onPressed: () {
                widget.addTimeZone();
              },
              icon: Icon(Icons.airplanemode_active),
              label: Text('Add Time Zone')),
        ],
      ),
    );
  }
}
