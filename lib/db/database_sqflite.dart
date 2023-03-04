import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:u_vocab/repository/word_repository.dart';

import '../model/word.dart';

class DBSQFlite extends WordRepository {
  Database? _database;

  _init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'u_vocab.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) {
    db.execute(
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
    return data
        .map(
          (e) => Word(
            e['VALUE'] as String,
            DateTime.fromMillisecondsSinceEpoch((e['CREATE_AT'] as int) * 1000),
          ),
        )
        .toSet();
  }
}
