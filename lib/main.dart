import 'package:flutter/material.dart';

void main() {
  runApp(const UVocab());
}

class UVocab extends StatelessWidget {
  const UVocab({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uVocab',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Home(title: 'uVocab'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'uVocab',
            ),
          ],
        ),
      ),
    );
  }
}
