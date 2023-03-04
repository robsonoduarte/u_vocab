import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:u_vocab/config/routes.dart';
import 'package:u_vocab/db/database_sqflite.dart';

GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<DBSQFlite>(DBSQFlite());
  runApp(const UVocab());
}

class UVocab extends StatelessWidget {
  const UVocab({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'uVocab',
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
    );
  }
}
