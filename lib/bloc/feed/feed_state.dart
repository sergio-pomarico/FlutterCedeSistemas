part of 'feed_bloc.dart';

class Post {
  Post.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    content = json['content'];
    photo = json['photo'];
    profileURL = json['profileURL'];
  }

  String? author;
  String? content;
  String? photo;
  String? profileURL;

  Post({this.author, this.content, this.photo, this.profileURL});
}

class FeedState {
  final List<Post>? post;
  FeedState({this.post});
}
