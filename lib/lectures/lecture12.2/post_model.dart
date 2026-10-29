import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String userId;
  final String title;
  final String body;
  final String username;
  final int likesCount;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.username,
    required this.likesCount,
  });
  Post.test({
    this.id = '0',
    this.userId = '6',
    this.title = 'empty',
    this.body = 'body',
    this.username = 'us',
    this.likesCount = 0,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'].toString(),
      userId: json['userId'].toString(),
      title: json['title'],
      body: json['body'],
      username: json['username'] ?? 'unknown',
      likesCount: int.tryParse(json['likesCount']) ?? 0,
    );
  }

  factory Post.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Post(
      id: doc.id,
      userId: data['userId'].toString(),
      title: data['title'],
      body: data['body'],
      username: data['username'] ?? 'unknown',
      likesCount: data['likesCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'body': body,
      'username': username,
      'likesCount': likesCount,
    };
  }
}
