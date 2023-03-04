import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:u_vocab/repository/word_repository.dart';

import '../model/word.dart';

class DBSQFlite extends WordRepository {
  Database? _database;

  DBSQFlite() {
    _init();
  }

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

  final _words = [
    Word('jaw', DateTime.now()),
    Word('generate', DateTime.now()),
    Word('boilerplate', DateTime.now()),
    Word('forklift', DateTime.now()),
    Word('treasury', DateTime.now()),
    Word('relative', DateTime.now()),
    Word('equity', DateTime.now()),
    Word('course', DateTime.now()),
    Word('focus', DateTime.now()),
    Word('rusty', DateTime.now()),
    Word('bag', DateTime.now()),
    Word('hell', DateTime.now()),
    Word('plenty', DateTime.now()),
    Word('class', DateTime.now()),
    Word('word', DateTime.now()),
    Word('breast', DateTime.now()),
    Word('death', DateTime.now()),
    Word('sign', DateTime.now()),
    Word('coule', DateTime.now()),
    Word('sergeant', DateTime.now()),
    Word('regulatory', DateTime.now()),
    Word('purse', DateTime.now()),
    Word('apology', DateTime.now()),
    Word('artistic', DateTime.now()),
    Word('chronicle', DateTime.now()),
    Word('attraction', DateTime.now()),
    Word('lobby', DateTime.now()),
    Word('cage', DateTime.now()),
    Word('accusation', DateTime.now()),
    Word('embassy', DateTime.now()),
    Word('flour', DateTime.now()),
    Word('heal', DateTime.now()),
    Word('parliament', DateTime.now()),
    Word('likely', DateTime.now()),
    Word('bet', DateTime.now()),
    Word('fold', DateTime.now()),
    Word('profound', DateTime.now()),
    Word('estimated', DateTime.now()),
    Word('bitter', DateTime.now()),
    Word('game', DateTime.now()),
    Word('shield', DateTime.now()),
    Word('chess', DateTime.now()),
    Word('stallion', DateTime.now()),
    Word('brow', DateTime.now()),
    Word('admission', DateTime.now()),
    Word('candy', DateTime.now()),
    Word('disengage', DateTime.now()),
    Word('stalker', DateTime.now()),
    Word('defer', DateTime.now()),
    Word('wooden', DateTime.now()),
    Word('conviction', DateTime.now()),
    Word('boom', DateTime.now()),
    Word('quiet', DateTime.now()),
    Word('launch', DateTime.now()),
    Word('frame', DateTime.now()),
    Word('comprise', DateTime.now()),
    Word('accelerometer', DateTime.now()),
    Word('gyroscope', DateTime.now()),
    Word('sensor', DateTime.now()),
    Word('award', DateTime.now()),
    Word('nutrition', DateTime.now()),
    Word('adolescent', DateTime.now()),
    Word('cotton', DateTime.now()),
    Word('daily', DateTime.now()),
    Word('flip', DateTime.now()),
    Word('layoff', DateTime.now()),
    Word('redundancy', DateTime.now()),
    Word('device', DateTime.now()),
    Word('permission', DateTime.now()),
    Word('muscle', DateTime.now()),
    Word('useful', DateTime.now()),
    Word('source', DateTime.now()),
    Word('alert', DateTime.now()),
    Word('system', DateTime.now()),
    Word('legacy', DateTime.now()),
    Word('forward', DateTime.now()),
    Word('power', DateTime.now()),
    Word('fusion', DateTime.now()),
    Word('thermal', DateTime.now()),
    Word('terminal', DateTime.now()),
    Word('database', DateTime.now()),
    Word('deep', DateTime.now()),
    Word('blue', DateTime.now()),
    Word('flexibility', DateTime.now()),
    Word('action', DateTime.now()),
    Word('sunset', DateTime.now()),
    Word('sunrise', DateTime.now()),
    Word('section', DateTime.now()),
    Word('curse', DateTime.now()),
    Word('summary', DateTime.now()),
    Word('flexible', DateTime.now()),
    Word('navigation', DateTime.now()),
    Word('build', DateTime.now()),
    Word('concept', DateTime.now()),
    Word('official', DateTime.now()),
    Word('between', DateTime.now()),
    Word('door', DateTime.now()),
    Word('doer', DateTime.now()),
    Word('cage', DateTime.now()),
    Word('hesitate', DateTime.now()),
    Word('hammer', DateTime.now()),
    Word('gorgeous', DateTime.now()),
    Word('focus', DateTime.now()),
    Word('description', DateTime.now()),
    Word('month', DateTime.now()),
    Word('expire', DateTime.now()),
    Word('regard', DateTime.now()),
    Word('painter', DateTime.now()),
    Word('fruition', DateTime.now()),
    Word('cycle', DateTime.now()),
    Word('destroy', DateTime.now()),
    Word('instance', DateTime.now()),
    Word('introduction', DateTime.now()),
    Word('required', DateTime.now()),
    Word('residential', DateTime.now()),
    Word('feed', DateTime.now()),
    Word('believer', DateTime.now()),
    Word('filter', DateTime.now()),
    Word('vanish', DateTime.now()),
    Word('algorithm', DateTime.now()),
    Word('secret', DateTime.now()),
    Word('key', DateTime.now()),
    Word('spec', DateTime.now()),
    Word('asymmetric', DateTime.now()),
    Word('symmetric', DateTime.now()),
    Word('understand', DateTime.now()),
    Word('brazilian', DateTime.now()),
    Word('environment', DateTime.now()),
    Word('saturday', DateTime.now()),
    Word('banking', DateTime.now()),
    Word('darling', DateTime.now()),
    Word('iron', DateTime.now()),
    Word('saddle', DateTime.now()),
    Word('technique', DateTime.now()),
    Word('deprecate', DateTime.now()),
    Word('peppermint', DateTime.now()),
    Word('damp', DateTime.now()),
    Word('some', DateTime.now()),
    Word('statement', DateTime.now()),
    Word('soak', DateTime.now()),
  ];

  @override
  save(String word) {
    if (_database!.isOpen) {
      _words.add(Word(word, DateTime.now()));
    }
  }

  @override
  Set<Word> list() => {..._words}.toSet();
}
