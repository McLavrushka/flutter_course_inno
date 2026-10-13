import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course_inno/lectures/lecture8/post_model.dart';
import 'package:http/http.dart' as http;

void main() {
    final json = '''
  {
      "id": 1,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
      "address": {
          "street": "Kulas Light",
          "suite": "Apt. 556",
          "city": "Gwenborough",
          "zipcode": "92998-3874",
          "geo": {
              "lat": "-37.3159",
              "lng": "81.1496"
          }
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
          "name": "Romaguera-Crona",
          "catchPhrase": "Multi-layered client-server neural-net",
          "bs": "harness real-time e-markets"
      }
  }
  ''';

  runApp(
    MaterialApp(
      home: Scaffold(body: Center(child: MyWidget())),
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isLoading = false;
  String? error;

  List<Post> posts = [];

  Future<void> load() async {
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
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

  @override
  void initState() {
    super.initState();
    load();
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
          ElevatedButton(onPressed: load, child: Text('Обновить'))],
      );
    }
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(child: Text(posts[index].id.toString())),
          title: Text(posts[index].title),
          subtitle: Row(
            children: [
              Flexible(child: Text(posts[index].body, maxLines: 1)),
              Text(posts[index].userId.toString()),
            ],
          ),
        );
      },
    );
  }
}
