import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_inno/lectures/lecture12.2/add_post_screen.dart';
import 'package:flutter_course_inno/lectures/lecture12.2/bloc/posts_bloc.dart';
import 'package:flutter_course_inno/lectures/lecture12.2/bloc/posts_event.dart';
import 'package:flutter_course_inno/lectures/lecture12.2/bloc/posts_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FirebaseAuth.instance.currentUser?.displayName ?? '?'),
        actions: [
          IconButton(
            tooltip: 'Только избранные',
            onPressed: () =>
                context.read<PostsBloc>().add(PostsFilterToggled()),
            icon: BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) => Icon(
                (state is PostsLoadSuccess && state.isFavorites)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              final post = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPostScreen()),
              );
              if (post == null || !context.mounted) return;
              context.read<PostsBloc>().add(PostAdded(post));
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
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoadInProgress) {
              return CircularProgressIndicator();
            }
            if (state is PostsLoadFailure) {
              return Column(
                children: [
                  Text(state.error),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PostsBloc>().add(PostsLoadRequested());
                    },
                    child: Text('Обновить'),
                  ),
                ],
              );
            }

            final posts = (state as PostsLoadSuccess).visiblePosts;
            if (posts.isEmpty) {
              return Column(
                children: [
                  Text('Ничего не найдено'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PostsBloc>().add(PostsLoadRequested());
                    },
                    child: Text('Обновить'),
                  ),
                ],
              );
            }
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
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
                          onPressed: () => context.read<PostsBloc>().add(
                            PostLikeToggled(post.id),
                          ),
                          icon: Icon(
                            Icons.favorite,
                            color: state.likedIds.contains(post.id)
                                ? Colors.red
                                : null,
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
      ),
    );
  }
}
