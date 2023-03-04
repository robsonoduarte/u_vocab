import 'dart:math';

import 'package:u_vocab/repository/word_repository.dart';

class Words {
  final _database = WordRepository.instance;
  String shuffle() {
    var words = _database.list();
    var index = Random().nextInt(words.length - 1);
    return words.elementAt(index).value;
  }

  save(String word) {
    _database.save(word);
  }

  int get total => _database.list().length;
}
