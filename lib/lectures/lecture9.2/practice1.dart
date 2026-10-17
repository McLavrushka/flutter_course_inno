// Практика 1: открыть экран и передать данные · 5 мин
// Запуск: flutter run -t lib/lectures/lecture9.2/practice1.dart

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
                // TODO 3: откройте ColorScreen через Navigator.push
                //         и передайте название (entry.key) и цвет (entry.value)
              },
            ),
        ],
      ),
    );
  }
}

// TODO 1: добавьте экрану два параметра конструктора: name (String) и color (Color)
class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO 2: Scaffold с AppBar (в заголовке — name)
    //         и backgroundColor экрана — color
    return const Scaffold();
  }
}
