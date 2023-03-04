import 'dart:math';

import 'package:u_vocab/model/word.dart';
import 'package:u_vocab/repository/word_repository.dart';

class Words {
  final _database = WordRepository.instance;
  Future<String> shuffle() async {
    var words = await _database.list();
    var index = Random().nextInt(words.length - 1);
    return words.elementAt(index).value;
  }

  save(String word) {
    _database.save(word);
  }

  Future<Set<Word>> list() async {
    return await _database.list();
  }
}
