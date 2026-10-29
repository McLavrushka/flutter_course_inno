import 'package:flutter_course_inno/lectures/lecture12/post_model.dart';

sealed class PostsEvent {}

class PostsLoadRequested extends PostsEvent {}

class PostLikeToggled extends PostsEvent {
  final String postId;
  PostLikeToggled(this.postId);
}

class PostsFilterToggled extends PostsEvent {}

class PostAdded extends PostsEvent {
  final Post post;
  PostAdded(this.post);
}
