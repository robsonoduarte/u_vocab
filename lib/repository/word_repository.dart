import 'package:get_it/get_it.dart';
import 'package:u_vocab/db/database_sqflite.dart';

import '../model/word.dart';

abstract class WordRepository {
  static WordRepository get instance => GetIt.I.get<DBSQFlite>();
  Future<void> start();
  Future<void> save(String word);
  Future<Set<Word>> list();
}
