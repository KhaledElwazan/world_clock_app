import 'package:flutter/material.dart';

class TimeZonesSelector extends StatelessWidget {

  static const routeName = '/timezone_selector';

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    List<String> timezones = arguments["timezones"];
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: List.generate(timezones.length, (int index) {
            return ListTile(
              title: Text(timezones[index]),
              onTap: () => Navigator.pop(context, index),
            );
          }),
        ),
      ),
    );
  }
}
