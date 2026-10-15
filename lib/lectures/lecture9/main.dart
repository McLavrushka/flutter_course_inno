import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course_inno/lectures/lecture9/post_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://6ad0f325addc5b5cb142904b.mockapi.io';
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationThemeData(
          fillColor: const Color.fromARGB(255, 171, 218, 240),
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
        ),
      ),
      home: Scaffold(
        body: SafeArea(child: Center(child: MyWidget())),
      ),
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  bool isLoading = false;
  String? error;

  List<Post> posts = [];

  Future<void> load() async {
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
    } catch (e) {
      setState(() => error = e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<Post> createPost(Post post) async {
    final url = Uri.parse('$baseUrl/posts');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Статус ${response.statusCode}');
    }
    return Post.fromJson(jsonDecode(response.body));
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    if (error != null) {
      return Text('Ошибка: $error');
    }
    if (posts.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text('Данные не найдены'),
          ElevatedButton(onPressed: load, child: Text('Обновить')),
        ],
      );
    }
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 10,
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
              print(titleController.text);
              print(bodyController.text);

              final post = await createPost(
                Post(
                  id: '',
                  userId: 99,
                  title: titleController.text,
                  body: bodyController.text,
                ),
              );
              setState(() {
                posts.add(post);
              });
              titleController.clear();
              bodyController.clear();
              if (!mounted) return;

              ScaffoldMessenger.of(context).showSnackBar(
                // 4
                SnackBar(content: Text('Создан пост ${post.id}')),
              );
            },
            child: Text('Добавить'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(posts[index].id.toString()),
                  ),
                  title: Text(posts[index].title),
                  subtitle: Row(
                    children: [
                      Flexible(child: Text(posts[index].body, maxLines: 1)),
                      Text(posts[index].userId.toString()),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// const url = 'https://6ad0f325addc5b5cb142904b.mockapi.io/posts';

// class Post {
//   final int userId;
//   final String title;
//   final String body;
//   Post({required this.userId, required this.title, required this.body});
//   Map<String, dynamic> toJson() {
//     return {'userId': userId, 'title': title, 'body': body};
//   }
// }

// void main() async {
//   final post = Post(userId: 1, title: 'Константин', body: 'Всего лучшего');
//   // TODO 1: отправьте post POST-запросом на url
//   //         (не забудьте заголовок Content-Type и jsonEncode)
//   final resp = await http.post(
//     Uri.parse(url),
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode(post),
//   );
//   // TODO 2: напечатайте статус ответа и id, который выдал сервер
//   print(resp.statusCode);
//   final respBody = jsonDecode(resp.body.toString());
//   print(respBody['id']);
// }
