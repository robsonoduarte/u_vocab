import 'package:go_router/go_router.dart';
import 'package:u_vocab/screen/dash_board.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashBoard(),
    ),
  ],
);
