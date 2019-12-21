import 'package:floor/floor.dart';
import 'package:world_clock_app/models/timezone.dart';

@dao
abstract class TimeZoneDao {
  @Query('SELECT * FROM TimeZone')
  Future<List<TimeZone>> findAllTimeZones();

  @insert
  Future<void> insertTimeZone(TimeZone timeZone);

  @Query('DELETE FROM TimeZone where timezone = :timezone')
  Future<void> deleteTimeZone(String timezone);
}
