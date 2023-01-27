import 'package:go_router/go_router.dart';
import 'package:u_vocab/screen/dash_board.dart';
import 'package:u_vocab/screen/words.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashBoard(),
      routes: [
        GoRoute(
          path: 'words',
          builder: (context, state) => const Words(),
        ),
        GoRoute(
          path: 'words/add',
          builder: (context, state) => const WordsAdd(),
        ),
      ],
    ),
  ],
);
