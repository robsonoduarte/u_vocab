import 'package:flutter/material.dart';
import 'package:u_vocab/config/routes.dart';

void main() {
  runApp(const UVocab());
}

class UVocab extends StatelessWidget {
  const UVocab({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'uVocab',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
    );
  }
}
