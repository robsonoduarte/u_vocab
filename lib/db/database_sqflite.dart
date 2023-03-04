import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:u_vocab/repository/word_repository.dart';

import '../model/word.dart';

class DBSQFlite extends WordRepository {
  Database? _database;

  _init() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, 'u_vocab.db');
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

  @override
  Future<void> start() async {
    await _init();
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
    var set = data
        .map(
          (e) => Word(
            e['VALUE'] as String,
            DateTime.fromMillisecondsSinceEpoch(
                (e['CREATED_AT'] as int) * 1000),
          ),
        )
        .toSet();
    return set;
  }
}
