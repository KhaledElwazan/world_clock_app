// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final database = _$AppDatabase();
    database.database = await database.open(
      name ?? ':memory:',
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TimeZoneDao _timezoneDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations,
      [Callback callback]) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TimeZone` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `weekNumber` INTEGER, `utcOffset` TEXT, `utcDatetime` TEXT, `unixtime` INTEGER, `timezone` TEXT, `rawOffset` INTEGER, `dstOffset` INTEGER, `dst` INTEGER, `dayOfYear` INTEGER, `dayOfWeek` INTEGER, `datetime` TEXT, `clientIp` TEXT, `abbreviation` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  TimeZoneDao get timezoneDao {
    return _timezoneDaoInstance ??= _$TimeZoneDao(database, changeListener);
  }
}

class _$TimeZoneDao extends TimeZoneDao {
  _$TimeZoneDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _timeZoneInsertionAdapter = InsertionAdapter(
            database,
            'TimeZone',
            (TimeZone item) => <String, dynamic>{
                  'id': item.id,
                  'weekNumber': item.weekNumber,
                  'utcOffset': item.utcOffset,
                  'utcDatetime': item.utcDatetime,
                  'unixtime': item.unixtime,
                  'timezone': item.timezone,
                  'rawOffset': item.rawOffset,
                  'dstOffset': item.dstOffset,
                  'dst': item.dst ? 1 : 0,
                  'dayOfYear': item.dayOfYear,
                  'dayOfWeek': item.dayOfWeek,
                  'datetime': item.datetime,
                  'clientIp': item.clientIp,
                  'abbreviation': item.abbreviation
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _timeZoneMapper = (Map<String, dynamic> row) => TimeZone(
      id: row['id'] as int,
      weekNumber: row['weekNumber'] as int,
      utcOffset: row['utcOffset'] as String,
      utcDatetime: row['utcDatetime'] as String,
      unixtime: row['unixtime'] as int,
      timezone: row['timezone'] as String,
      rawOffset: row['rawOffset'] as int,
      dstOffset: row['dstOffset'] as int,
      dst: (row['dst'] as int) != 0,
      dayOfYear: row['dayOfYear'] as int,
      dayOfWeek: row['dayOfWeek'] as int,
      datetime: row['datetime'] as String,
      clientIp: row['clientIp'] as String,
      abbreviation: row['abbreviation'] as String);

  final InsertionAdapter<TimeZone> _timeZoneInsertionAdapter;

  @override
  Future<List<TimeZone>> findAllTimeZones() async {
    return _queryAdapter.queryList('SELECT * FROM TimeZone',
        mapper: _timeZoneMapper);
  }

  @override
  Future<void> deleteTimeZone(String timezone) async {
    await _queryAdapter.queryNoReturn('DELETE FROM TimeZone where timezone = ?',
        arguments: <dynamic>[timezone]);
  }

  @override
  Future<void> insertTimeZone(TimeZone timeZone) async {
    await _timeZoneInsertionAdapter.insert(
        timeZone, sqflite.ConflictAlgorithm.abort);
  }
}
