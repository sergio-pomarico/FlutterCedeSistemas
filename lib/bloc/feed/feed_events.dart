part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent {}

class LoadPosts extends FeedEvent {
  LoadPosts();
}
