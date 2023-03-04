import 'package:get_it/get_it.dart';
import 'package:u_vocab/db/database_sqflite.dart';

import '../model/word.dart';

abstract class WordRepository {
  static final WordRepository _instance = GetIt.I.get<DBSQFlite>();
  static WordRepository get instance => _instance;
  void save(String word);
  Set<Word> list();
}
