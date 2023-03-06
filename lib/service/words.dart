import 'dart:math';

import 'package:u_vocab/model/word.dart';
import 'package:u_vocab/repository/word_repository.dart';

class Words {
  WordRepository? _repository;

  Words() {
    _repository = WordRepository.instance;
  }

  Future<String> shuffle() async {
    var words = await _repository!.list();
    var index = Random().nextInt(words.length - 1);
    return words.elementAt(index).value;
  }

  save(String word) {
    _repository!.save(word);
  }

  Future<Set<Word>> list() async {
    return await _repository!.list();
  }
}
