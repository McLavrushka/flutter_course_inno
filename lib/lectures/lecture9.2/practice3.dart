// Практика 3: диалог «Вы уверены?» · 5 мин
// Запуск: flutter run -t lib/lectures/lecture9.2/practice3.dart

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: NotesScreen()));

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final List<String> _notes = ['Купить молоко', 'Сдать ДЗ 4', 'Выспаться'];

  Future<void> _delete(int index) async {
    // TODO 1: покажите AlertDialog «Удалить заметку?»
    //         с кнопками «Отмена» (pop с false) и «Удалить» (pop с true):
    //         final confirmed = await showDialog<bool>(...);

    // TODO 2: если confirmed == true — удалите заметку через setState
    //         и покажите SnackBar «Удалено»
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Заметки')),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_notes[index]),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _delete(index),
          ),
        ),
      ),
    );
  }
}
