import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ファースト')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.push('/second');
              },
              child: const Text('次の画面へ'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/third');
              },
              child: const Text('最後の画面へ'),
            ),
          ],
        ),
      ),
    );
  }
}
