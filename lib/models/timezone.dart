class TimeZone {
  int weekNumber;
  String utcOffset;
  String utcDatetime;
  int unixtime;
  String timezone;
  int rawOffset;
  Null dstUntil;
  int dstOffset;
  Null dstFrom;
  bool dst;
  int dayOfYear;
  int dayOfWeek;
  String datetime;
  String clientIp;
  String abbreviation;

  TimeZone(
      {this.weekNumber,
      this.utcOffset,
      this.utcDatetime,
      this.unixtime,
      this.timezone,
      this.rawOffset,
      this.dstUntil,
      this.dstOffset,
      this.dstFrom,
      this.dst,
      this.dayOfYear,
      this.dayOfWeek,
      this.datetime,
      this.clientIp,
      this.abbreviation});

  TimeZone.fromJson(Map<String, dynamic> json) {
    weekNumber = json['week_number'];
    utcOffset = json['utc_offset'];
    utcDatetime = json['utc_datetime'];
    unixtime = json['unixtime'];
    timezone = json['timezone'];
    rawOffset = json['raw_offset'];
    dstUntil = json['dst_until'];
    dstOffset = json['dst_offset'];
    dstFrom = json['dst_from'];
    dst = json['dst'];
    dayOfYear = json['day_of_year'];
    dayOfWeek = json['day_of_week'];
    datetime = json['datetime'];
    clientIp = json['client_ip'];
    abbreviation = json['abbreviation'];
  }

  @override
  String toString() {
    return 'TimeZone{weekNumber: $weekNumber, utcOffset: $utcOffset, utcDatetime: $utcDatetime, unixtime: $unixtime, timezone: $timezone, rawOffset: $rawOffset, dstUntil: $dstUntil, dstOffset: $dstOffset, dstFrom: $dstFrom, dst: $dst, dayOfYear: $dayOfYear, dayOfWeek: $dayOfWeek, datetime: $datetime, clientIp: $clientIp, abbreviation: $abbreviation}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['week_number'] = this.weekNumber;
    data['utc_offset'] = this.utcOffset;
    data['utc_datetime'] = this.utcDatetime;
    data['unixtime'] = this.unixtime;
    data['timezone'] = this.timezone;
    data['raw_offset'] = this.rawOffset;
    data['dst_until'] = this.dstUntil;
    data['dst_offset'] = this.dstOffset;
    data['dst_from'] = this.dstFrom;
    data['dst'] = this.dst;
    data['day_of_year'] = this.dayOfYear;
    data['day_of_week'] = this.dayOfWeek;
    data['datetime'] = this.datetime;
    data['client_ip'] = this.clientIp;
    data['abbreviation'] = this.abbreviation;
    return data;
  }
}
