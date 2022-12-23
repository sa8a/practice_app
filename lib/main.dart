import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // 開発中のSlow Modeバナーを非表示にする
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// トグルスイッチ
final isOnProvaider = StateProvider((ref) {
  return true;
});

// スライダーの数値
final valueProvider = StateProvider((ref) {
  return 0.0;
});

// レンジスライダー
final rangeProvider = StateProvider((ref) {
  return const RangeValues(0.0, 1.0);
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOn = ref.watch(isOnProvaider);
    final toggleSwitch = Switch(
      value: isOn,
      onChanged: (isOn) {
        ref.read(isOnProvaider.notifier).state = isOn;
      },
      activeColor: Colors.blue,
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.black,
      inactiveTrackColor: Colors.grey,
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            toggleSwitch,
          ],
        ),
      ),
    );
  }
}
