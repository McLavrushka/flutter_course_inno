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

  // TODO 1: создайте контроллер и освободите его в dispose()

  void ask() {
    // TODO 3: если поле пустое — answer = 'Сначала задайте вопрос',
    //         иначе — случайный ответ: answers[Random().nextInt(answers.length)].
    //         Не забудьте setState и очистите поле.
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 12,
        children: [
          // TODO 2: TextField с controller и hintText «Ваш вопрос».
          //         Оформление: заливка, скругление, без подчёркивания.
          ElevatedButton(onPressed: ask, child: const Text('Спросить')),
          Text(answer, style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
