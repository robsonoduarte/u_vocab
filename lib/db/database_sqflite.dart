import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:u_vocab/repository/word_repository.dart';

import '../model/word.dart';

class DBSQFlite extends WordRepository {
  Database? _database;

  _init() async {
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, 'u_vocab.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE WORDS (ID INTEGER PRIMARY KEY, VALUE TEXT, CREATED_AT INTEGER, UPDATED_AT INTEGER, REVIEWED_AT INTEGER)',
    );
  }

  Future<void> init() async {
    await _init();
  }

  DateTime _toDateTime(int value) {
    return DateTime.fromMillisecondsSinceEpoch(value * 1000);
  }

  @override
  Future<void> save(String word) async {
    _database!.insert(
      'WORDS',
      {
        "VALUE": word,
        'CREATED_AT': DateTime.now().millisecondsSinceEpoch ~/ 1000,
      },
    );
  }

  @override
  Future<Set<Word>> list() async {
    var data = await _database!.rawQuery('SELECT * FROM WORDS');
    return data
        .map(
          (word) => Word(
            word['VALUE'] as String,
            _toDateTime(word['CREATED_AT'] as int),
          ),
        )
        .toSet();
  }
}
