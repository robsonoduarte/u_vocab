import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:u_vocab/model/word.dart';
import 'package:u_vocab/service/words.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String _word = '';
  final _words = GetIt.I.get<Words>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('uVocab'),
      ),
      body: Center(
        child: FutureBuilder<Set<Word>>(
          future: _words.list(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Total Words : ${snapshot.data!.length}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 20, 80, 0),
                    child: ElevatedButton(
                        onPressed: () async {
                          var word = await _words.shuffle();
                          launchUrl(
                            Uri.parse(
                              'https://www.google.com/search?q=define+$word',
                            ),
                            mode: LaunchMode.externalApplication,
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
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('New Word'),
              content: TextField(
                decoration: const InputDecoration(
                  hintText: 'add new word',
                ),
                onChanged: (value) {
                  setState(() {
                    _word = value;
                  });
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
                TextButton(
                  onPressed: () async {
                    _words.save(_word);
                    launchUrl(
                      Uri.parse(
                        'https://www.google.com/search?q=define+$_word',
                      ),
                      mode: LaunchMode.externalApplication,
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save/Google'),
                ),
              ],
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
