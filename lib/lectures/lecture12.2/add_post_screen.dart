import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_inno/lectures/lecture12.2/post_model.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Заголовок',
                hintText: 'Введите заголовок',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Описание',
                hintText: 'Введите описание',
              ),
              controller: bodyController,
            ),
            ElevatedButton(
              onPressed: () async {
                if (!mounted) return;
                Navigator.pop(
                  context,
                  Post(
                    id: '',
                    userId: FirebaseAuth.instance.currentUser?.uid ?? '-1',
                    title: titleController.text,
                    body: bodyController.text,
                    username:
                        FirebaseAuth.instance.currentUser?.displayName ??
                        'unknown',
                    likesCount: 0,
                  ),
                );
              },
              child: Text('Добавить'),
            ),
          ],
        ),
      ),
    );
  }
}
