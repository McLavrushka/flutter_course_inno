import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_inno/lectures/lecture12/bloc/posts_event.dart';
import 'package:flutter_course_inno/lectures/lecture12/bloc/posts_state.dart';
import 'package:flutter_course_inno/lectures/lecture12/post_model.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsLoadInProgress()) {
    on<PostsLoadRequested>(_onLoadRequested);
  }
  Future<void> _onLoadRequested(
    PostsLoadRequested event,
    Emitter<PostsState> emit,
  ) async {
    emit(PostsLoadInProgress());
    try {
      // final snapshot = await FirebaseFirestore.instance
      //     .collection('items')
      //     .orderBy('title')
      //     .get();

      await emit.forEach(
        FirebaseFirestore.instance
            .collection('items')
            .orderBy('title')
            .snapshots(),
        onData: (snapshot) =>
            PostsLoadSuccess(snapshot.docs.map(Post.fromFirestore).toList()),
        onError: (error, stackTrace) => PostsLoadFailure('Ошибка: $error'),
      );
      // var posts = snapshot.docs.map(Post.fromFirestore).toList();
      // emit(PostsLoadSuccess(posts));
    } catch (e) {
      emit(PostsLoadFailure('Ошибка: $e'));
    }
  }
}
