// Практика 3 — решение
// Запуск: flutter run -t lib/lectures/lecture9.2/practice3_solution.dart

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
    // 1
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить заметку?'),
        content: Text(_notes[index]),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );

    // 2
    if (!mounted) return;
    if (confirmed != true) return; // false — «Отмена», null — тап мимо диалога
    setState(() => _notes.removeAt(index));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Удалено')),
    );
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
