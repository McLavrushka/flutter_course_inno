// Практика 1 — решение
// Запуск: flutter run -t lib/lectures/lecture9.2/practice1_solution.dart

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ColorsScreen()));

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  static const colors = {
    'Красный': Colors.red,
    'Зелёный': Colors.green,
    'Синий': Colors.blue,
    'Оранжевый': Colors.orange,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Цвета')),
      body: ListView(
        children: [
          for (final entry in colors.entries)
            ListTile(
              leading: CircleAvatar(backgroundColor: entry.value),
              title: Text(entry.key),
              onTap: () {
                // 3
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ColorScreen(name: entry.key, color: entry.value),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class ColorScreen extends StatelessWidget {
  // 1
  const ColorScreen({super.key, required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // 2
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      backgroundColor: color,
    );
  }
}
