part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent {}

class LoadPosts extends FeedEvent {
  LoadPosts();
}

class CreatePost extends FeedEvent {
  CreatePost({required this.image, required this.content});
  final XFile? image;
  final String content;
}
