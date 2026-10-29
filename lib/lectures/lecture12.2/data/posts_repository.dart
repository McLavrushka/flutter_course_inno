import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_course_inno/lectures/lecture12.2/post_model.dart';

class PostsRepository {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  CollectionReference<Map<String, dynamic>> get _favorites => _db
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('favorites');

  Stream<List<Post>> watchPosts() => _db
      .collection('items')
      .orderBy('title')
      .snapshots()
      .map((snapshot) => snapshot.docs.map(Post.fromFirestore).toList());

  Future<Set<String>> fetchLikedIds() async {
    final snapshot = await _favorites.get();
    return snapshot.docs.map((doc) => doc.id).toSet();
  }

  Future<void> toggleLike(String postId, bool isLiked) async {
    if (isLiked) {
      await _favorites.doc(postId).delete();
    } else {
      await _favorites.doc(postId).set({
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<void> addPost(Post post) => _db.collection('items').add({
    ...post.toJson(),
    'userId': _auth.currentUser!.uid,
    'createdAt': FieldValue.serverTimestamp(),
  });
}
