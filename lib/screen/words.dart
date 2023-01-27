import 'package:flutter/material.dart';

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
    );
  }
}
