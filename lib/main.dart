import 'package:flutter/material.dart';
import 'package:practice_app/first_page.dart';
import 'package:practice_app/second_page.dart';
import 'package:practice_app/third_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GoRouter(
    // パス (アプリが起動したとき)
    initialLocation: '/first',

    // パスと画面の組み合わせ
    routes: [
      GoRoute(
        path: '/first',
        builder: (context, state) => const FirstPage(),
      ),
      GoRoute(
        path: '/second',
        builder: (context, state) => const SecondPage(),
      ),
      GoRoute(
        path: '/third',
        builder: (context, state) => const ThirdPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // go_routerのおまじない
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
