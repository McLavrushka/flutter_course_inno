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
    body: 'Ваше пожелание',
  );
  

  // TODO 1: отправьте post POST-запросом на url
  //         (не забудьте заголовок Content-Type и jsonEncode)

  // TODO 2: напечатайте статус ответа и id, который выдал сервер
}
