import 'package:flutter/material.dart';
import 'package:u_vocab/service/worlds.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final _worlds = Worlds();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('uVocab'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Total Worlds : ${_worlds.total}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 20, 80, 0),
              child: ElevatedButton(
                  onPressed: () async {
                    launchUrl(
                      Uri.parse(
                          'https://www.google.com/search?q=define+${_worlds.shuffle()}'),
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.shuffle,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('shuffle one world'),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
/*      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go("/words");
        },
        child: const Icon(
          Icons.add,
        ),
      ),*/
    );
  }
}