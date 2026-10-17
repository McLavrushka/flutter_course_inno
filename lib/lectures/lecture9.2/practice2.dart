// Практика 2: вернуть результат с экрана · 7 мин
// Запуск: flutter run -t lib/lectures/lecture9.2/practice2.dart

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _mood = 'не выбрано';

  Future<void> _chooseMood() async {
    // TODO 2: откройте MoodScreen и дождитесь результата:
    //         final mood = await Navigator.push<String>(...);

    // TODO 3: если mood не null — сохраните его в _mood через setState
    //         (не забудьте: после await сначала if (!mounted) return;)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настроение')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Сегодня: $_mood', style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 24),
            FilledButton(onPressed: _chooseMood, child: const Text('Выбрать')),
          ],
        ),
      ),
    );
  }
}

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  static const moods = ['😀', '🙂', '😐', '😴', '🤯'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Как дела?')),
      body: Center(
        child: Wrap(
          spacing: 16,
          children: [
            for (final mood in moods)
              InkWell(
                onTap: () {
                  // TODO 1: закройте экран и верните выбранный mood
                },
                child: Text(mood, style: const TextStyle(fontSize: 48)),
              ),
          ],
        ),
      ),
    );
  }
}
