part of 'feed_bloc.dart';

class Post {
  Post.fromJSON(Map<String, dynamic> json) {
    author = json['author'] as String;
    content = json['content'] as String;
    photo = json['photo'] as String;
    profileURL = json['profileURL'] as String;
  }

  String? author;
  String? content;
  String? photo;
  String? profileURL;

  Post(
      {required this.author,
      required this.content,
      required this.photo,
      required this.profileURL});
}

class FeedState {
  List<Post>? posts;
  FeedState({this.posts});
}
