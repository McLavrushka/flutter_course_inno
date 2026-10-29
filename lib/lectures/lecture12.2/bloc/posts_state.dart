import 'package:flutter_course_inno/lectures/lecture12.2/post_model.dart';

sealed class PostsState {}

class PostsLoadInProgress extends PostsState {}

class PostsLoadSuccess extends PostsState {
  final List<Post> posts;
  final Set<String> likedIds;
  final bool isFavorites;
  PostsLoadSuccess({
    required this.posts,
    this.likedIds = const {},
    this.isFavorites = false,
  });

  PostsLoadSuccess copyWith({
    List<Post>? posts,
    Set<String>? likedIds,
    bool? isFavorites,
  }) {
    return PostsLoadSuccess(
      posts: posts ?? this.posts,
      likedIds: likedIds ?? this.likedIds,
      isFavorites: isFavorites ?? this.isFavorites,
    );
  }

  List<Post> get visiblePosts => isFavorites
      ? posts.where((post) => likedIds.contains(post.id)).toList()
      : posts;
}

class PostsLoadFailure extends PostsState {
  final String error;
  PostsLoadFailure(this.error);
}


