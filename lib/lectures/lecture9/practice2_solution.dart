import 'dart:math';

import 'package:flutter/material.dart';

const answers = [
  'Однозначно да',
  'Спроси после дедлайна',
  'Звёзды говорят «нет»',
  'Hot reload покажет',
  'Скорее да, чем нет',
  'Сначала допиши TODO',
];

void main() {
  runApp(
    const MaterialApp(home: Scaffold(body: SafeArea(child: MagicBall()))),
  );
}

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  String answer = '';

  // 1
  final questionController = TextEditingController();

  @override
  void dispose() {
    questionController.dispose();
    super.dispose();
  }

  // 3
  void ask() {
    setState(() {
      if (questionController.text.isEmpty) {
        answer = 'Сначала задайте вопрос';
      } else {
        answer = answers[Random().nextInt(answers.length)];
      }
    });
    questionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 12,
        children: [
          // 2
          TextField(
            controller: questionController,
            decoration: InputDecoration(
              hintText: 'Ваш вопрос',
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          ElevatedButton(onPressed: ask, child: const Text('Спросить')),
          Text(answer, style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
