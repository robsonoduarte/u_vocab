import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Words extends StatelessWidget {
  const Words({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Words"),
      ),
      body: const Center(
        child: Text('Words'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go("/words/add");
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class WordsAdd extends StatelessWidget {
  const WordsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Word'),
      ),
      body: const Center(
        child: Text('Add Word'),
      ),
    );
  }
}
