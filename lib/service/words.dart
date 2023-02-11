import 'dart:math';

import 'package:u_vocab/db/database.dart';

class Words {
  final _database = DataBase();
  String shuffle() {
    var words = _database.words;
    var index = Random().nextInt(words.length - 1);
    return words.elementAt(index);
  }

  save(String word) {
    _database.save(word);
  }

  int get total => _database.words.length;
}
