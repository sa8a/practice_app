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
final isOnProvider = StateProvider((ref) {
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
    // トグルスイッチ
    final isOn = ref.watch(isOnProvider);
    final toggleSwitch = Switch(
      value: isOn,
      onChanged: (isOn) {
        ref.read(isOnProvider.notifier).state = isOn;
      },
      activeColor: Colors.blue,
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.black,
      inactiveTrackColor: Colors.grey,
    );

    // スライダー
    final value = ref.watch(valueProvider);
    final slider = Slider(
      value: value,
      onChanged: (value) {
        ref.read(valueProvider.notifier).state = value;
        print(value);
      },
      thumbColor: Colors.blue,
      activeColor: Colors.green,
      inactiveColor: Colors.black,
    );

    // レンジスライダー
    final range = ref.watch(rangeProvider);
    final rangeSlider = RangeSlider(
      values: range,
      onChanged: (range) {
        ref.read(rangeProvider.notifier).state = range;
        print(range);
      },
      activeColor: Colors.green,
      inactiveColor: Colors.black,
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            toggleSwitch,
            slider,
            rangeSlider,
          ],
        ),
      ),
    );
  }
}
