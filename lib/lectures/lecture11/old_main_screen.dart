import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_inno/lectures/lecture11/add_post_screen.dart';
import 'package:flutter_course_inno/lectures/lecture11/post_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://6ad0f325addc5b5cb142904b.mockapi.io';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = false;
  String? error;

  List<Post> posts = [];

  Future<List<Post>> load() async {
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode != 200) {
        throw Exception('Статус ${response.statusCode}');
      }

      final decoded = jsonDecode(response.body) as List;

      for (final el in decoded) {
        final post = Post.fromJson(el);
        posts.add(post);
      }

      setState(() => posts = decoded.map((e) => Post.fromJson(e)).toList());
      return posts;
    } catch (e) {
      setState(() => error = e.toString());
      return [];
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _importFromMockApi() async {
    final items = await load(); // ваш GET из ДЗ 4
    final db = FirebaseFirestore.instance;
    final batch = db.batch();
    for (final item in items) {
      batch.set(db.collection('items').doc(), {
        ...item.toJson(),
        'ownerId': FirebaseAuth.instance.currentUser!.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
    await batch.commit();
  }

  final _itemsStream = FirebaseFirestore.instance
      .collection('items')
      .snapshots();

  @override
  void initState() {
    super.initState();
    // load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: _importFromMockApi, child: Text('Импорт')),
          IconButton(
            onPressed: () async {
              final post = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPostScreen()),
              );
              if (!mounted) return;
              if (post == null) return;
              // setState(() {
              //   posts.add(post);
              // });
            },
            icon: Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: Text('Выйти'),
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: _itemsStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                !snapshot.hasData) {
              return CircularProgressIndicator();
            }
            final docs = snapshot.data!.docs.map(Post.fromFirestore).toList();
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(docs[index].id.toString()),
                    ),
                    title: Text(docs[index].title),
                    subtitle: Row(
                      children: [
                        Flexible(child: Text(docs[index].body, maxLines: 1)),
                        Text(docs[index].userId.toString()),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
