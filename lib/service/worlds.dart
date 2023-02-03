import 'dart:math';

import 'package:u_vocab/db/database.dart';

class Worlds {
  final _database = DataBase();
  String shuffle() {
    var words = _database.words;
    var index = Random().nextInt(words.length - 1);
    return words.elementAt(index);
  }

  int get total => _database.words.length;
}
