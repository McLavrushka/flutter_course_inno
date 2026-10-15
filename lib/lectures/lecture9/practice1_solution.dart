import 'dart:convert';

import 'package:http/http.dart' as http;

const url = 'https://6ad0d7ebaddc5b5cb14266d4.mockapi.io/posts';

class Post {
  final int userId;
  final String title;
  final String body;

  Post({required this.userId, required this.title, required this.body});

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'title': title, 'body': body};
  }
}

void main() async {
  final post = Post(
    userId: 1,
    title: 'Ваше имя',
    body: 'Что запомнилось на лекции?',
  );

  // 1
  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(post.toJson()),
  );

  // 2
  print('Статус: ${response.statusCode}'); // 201
  final json = jsonDecode(utf8.decode(response.bodyBytes));
  print('Пост сохранён, id: ${json['id']}');
}
