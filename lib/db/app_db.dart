import 'dart:async';

import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:world_clock_app/db/dao.dart';
import 'package:world_clock_app/models/timezone.dart';

part 'app_db.g.dart';

@Database(version: 1, entities: [TimeZone])
abstract class AppDatabase extends FloorDatabase {
  static const String DB_NAME = 'app_database.db';

  TimeZoneDao get timezoneDao;
}

/*
*   static final _timeZoneMapper = (Map<String, dynamic> row) => TimeZone(
      weekNumber: row['weekNumber'] as int,
      abbreviation: row['abbreviation'] as String,
      clientIp: row['clientIp'] as String,
      datetime: row['datetime'] as String,
      dayOfWeek: row['dayOfWeek'] as int,
      dayOfYear: row['dayOfYear'] as int,
      dst: (row['dst'] as int) != 0,
      dstOffset: row['dstOffset'] as int,
      rawOffset: row['rawOffset'] as int,
      timezone: row['timezone'] as String,
      unixtime: row['unixtime'] as int,
      utcOffset: row['utcOffset'] as String,
      utcDatetime: row['utcDatetime'] as String);*/
