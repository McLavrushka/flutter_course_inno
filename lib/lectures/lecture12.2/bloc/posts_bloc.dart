import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_inno/lectures/lecture12.2/bloc/posts_event.dart';
import 'package:flutter_course_inno/lectures/lecture12.2/bloc/posts_state.dart';
import 'package:flutter_course_inno/lectures/lecture12.2/data/posts_repository.dart';
import 'package:flutter_course_inno/lectures/lecture12.2/post_model.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _repository;
  PostsBloc(this._repository) : super(PostsLoadInProgress()) {
    on<PostsLoadRequested>(_onLoadRequested);
    on<PostLikeToggled>(_onLikeToggled);
    on<PostsFilterToggled>(_onFilterToggled);
    on<PostAdded>((event, emit) => _repository.addPost(event.post as Post));

  }
  Future<void> _onLoadRequested(
    PostsLoadRequested event,
    Emitter<PostsState> emit,
  ) async {
    emit(PostsLoadInProgress());
    final likedIds = await _repository.fetchLikedIds();

    try {
      await emit.forEach(
        _repository.watchPosts(),
        onData: (snapshot) {
          final posts = snapshot;
          final s = state;
          return s is PostsLoadSuccess
              ? s.copyWith(posts: posts)
              : PostsLoadSuccess(posts: posts, likedIds: likedIds);
        },

        onError: (error, stackTrace) => PostsLoadFailure('Ошибка: $error'),
      );
    } catch (e) {
      emit(PostsLoadFailure('Ошибка: $e'));
    }
  }

  Future<void> _onLikeToggled(
    PostLikeToggled event,
    Emitter<PostsState> emit,
  ) async {
    final s = state as PostsLoadSuccess;
    final ids = {...s.likedIds};
    if (ids.contains(event.postId)) {
      ids.remove(event.postId);
    } else {
      ids.add(event.postId);
    }
    await _repository.toggleLike(event.postId, ids.contains(event.postId));
    emit(s.copyWith(likedIds: ids));
  }

  void _onFilterToggled(PostsFilterToggled event, Emitter<PostsState> emit) {
    final s = state;

    if (s is PostsLoadSuccess) {
      emit(s.copyWith(isFavorites: !s.isFavorites));
    }
  }
}
