// Практика 2 — решение
// Запуск: flutter run -t lib/lectures/lecture9.2/practice2_solution.dart

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
    // 2
    final mood = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const MoodScreen()),
    );

    // 3
    if (!mounted) return;
    if (mood == null) return; // ушли «назад», ничего не выбрав
    setState(() => _mood = mood);
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
                  // 1
                  Navigator.pop(context, mood);
                },
                child: Text(mood, style: const TextStyle(fontSize: 48)),
              ),
          ],
        ),
      ),
    );
  }
}
