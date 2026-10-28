import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_inno/lectures/lecture12/bloc/posts_state.dart';
import 'package:flutter_course_inno/lectures/lecture12/post_model.dart';

// class PostsCubit extends Cubit<PostsState> {
//   PostsCubit() : super(PostsLoadInProgress());

//   Future<void> load() async {
//     emit(PostsLoadInProgress());
//     try {
//       final snapshot = await FirebaseFirestore.instance
//           .collection('items')
//           .orderBy('title')
//           .get();
//       final posts = snapshot.docs.map(Post.fromFirestore).toList();
//       emit(PostsLoadSuccess(posts));
//     } catch (e) {
//       emit(PostsLoadFailure('Не удалось загрузить посты'));
//     }
//   }
// }

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsLoadInProgress());

  StreamSubscription? _subscription;

  void load() {
    emit(PostsLoadInProgress());
    _subscription?.cancel();
    _subscription = FirebaseFirestore.instance
        .collection('items')
        .orderBy('title')
        .snapshots()
        .listen(
          (snapshot) => emit(
            PostsLoadSuccess(snapshot.docs.map(Post.fromFirestore).toList()),
          ),
          onError: (error) =>
              emit(PostsLoadFailure('Не удалось загрузить посты')),
        );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
