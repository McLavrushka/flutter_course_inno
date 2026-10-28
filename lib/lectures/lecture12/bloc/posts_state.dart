import 'package:flutter_course_inno/lectures/lecture12/post_model.dart';

sealed class PostsState {}

class PostsLoadInProgress extends PostsState {}

class PostsLoadSuccess extends PostsState {
  final List<Post> posts;
  PostsLoadSuccess(this.posts);
}

class PostsLoadFailure extends PostsState {
  final String error;
  PostsLoadFailure(this.error);
}
