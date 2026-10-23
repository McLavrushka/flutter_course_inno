import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final int userId;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
  Post.test({
    this.id = '0',
    this.userId = 6,
    this.title = 'empty',
    this.body = 'body',
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }

  factory Post.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Post(
      id: doc.id,
      userId: data['userId'],
      title: data['title'],
      body: data['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'title': title, 'body': body};
  }
}
