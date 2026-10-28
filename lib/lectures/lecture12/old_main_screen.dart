import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_inno/lectures/lecture12/add_post_screen.dart';
import 'package:flutter_course_inno/lectures/lecture12/bloc/posts_bloc.dart';
import 'package:flutter_course_inno/lectures/lecture12/bloc/posts_cubit.dart';
import 'package:flutter_course_inno/lectures/lecture12/bloc/posts_state.dart';
import 'package:flutter_course_inno/lectures/lecture12/post_model.dart';
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
  final uid = FirebaseAuth.instance.currentUser!.uid;
  bool isFavorites = false;

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
    print('success');
  }

  final _itemsStream = FirebaseFirestore.instance
      .collection('items')
      .orderBy('title')
      .snapshots();

  late final myPosts = FirebaseFirestore.instance
      .collection('items')
      .where('userId', isEqualTo: uid)
      .orderBy('createdAt', descending: true)
      .limit(20)
      .snapshots();

  final _favStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('favorites')
      .snapshots();

  DocumentReference favRef(String postId) => FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('favorites')
      .doc(postId);

  toggleLike(String postId, bool isLiked) async {
    if (isLiked) {
      await favRef(postId).delete();
      FirebaseFirestore.instance.collection('items').doc(postId).update({
        'likesCount': FieldValue.increment(-1),
      });
    } else {
      await favRef(postId).set({'createdAt': FieldValue.serverTimestamp()});
      FirebaseFirestore.instance.collection('items').doc(postId).update({
        'likesCount': FieldValue.increment(1),
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FirebaseAuth.instance.currentUser?.displayName ?? '?'),
        actions: [
          IconButton(
            tooltip: 'Только избранные',
            onPressed: () => setState(() => isFavorites = !isFavorites),
            icon: Icon(isFavorites ? Icons.favorite : Icons.favorite_border),
          ),

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
        child: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            if (state is PostsLoadInProgress) {
              return CircularProgressIndicator();
            }
            if (state is PostsLoadFailure) {
              return Text(state.error);
            }
            final posts = (state as PostsLoadSuccess).posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                final isLiked = false; //likeIds.contains(post.id);
                return InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Text(post.title),
                    subtitle: Row(
                      children: [
                        Flexible(child: Text(post.username, maxLines: 1)),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => toggleLike(post.id, isLiked),
                          icon: Icon(
                            Icons.favorite,
                            color: isLiked ? Colors.red : null,
                          ),
                        ),
                        Text(post.likesCount.toString()),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),

        //  StreamBuilder(
        //   stream: _itemsStream,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting ||
        //         !snapshot.hasData) {
        //       return CircularProgressIndicator();
        //     }
        //     final docs = snapshot.data!.docs.map(Post.fromFirestore).toList();
        //     return StreamBuilder(
        //       stream: _favStream,
        //       builder: (context, favSnapshot) {
        //         final likeIds =
        //             favSnapshot.data?.docs.map((e) => e.id).toSet() ?? {};
        //         final visible = isFavorites
        //             ? docs.where((p) => likeIds.contains(p.id)).toList()
        //             : docs;

        //         if (visible.isEmpty) {
        //           return Center(
        //             child: Text(isFavorites ? 'Нет избранных' : 'Нет постов'),
        //           );
        //         }
        // return ListView.builder(
        //   itemCount: visible.length,
        //   itemBuilder: (context, index) {
        //     final post = visible[index];
        //     final isLiked = likeIds.contains(post.id);
        //     return InkWell(
        //       onTap: () {},
        //       child: ListTile(
        //         leading: CircleAvatar(),
        //         title: Text(post.title),
        //         subtitle: Row(
        //           children: [
        //             Flexible(child: Text(post.username, maxLines: 1)),
        //           ],
        //         ),
        //         trailing: Row(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             IconButton(
        //               onPressed: () => toggleLike(post.id, isLiked),
        //               icon: Icon(
        //                 Icons.favorite,
        //                 color: isLiked ? Colors.red : null,
        //               ),
        //             ),
        //             Text(post.likesCount.toString()),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // );
        //       },
        //     );
        //   },
        // ),
      ),
    );
  }
}
