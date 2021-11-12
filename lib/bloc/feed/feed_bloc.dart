library bloc.feed;

// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/repository/database_repository.dart';

part './feed_state.dart';
part './feed_events.dart';

class FeedBLoC extends Bloc<FeedEvent, FeedState> {
  FeedBLoC() : super(FeedState());

  final DataBaseRepository repository = locator<DataBaseRepository>();
  final NavigatorService navigator = locator<NavigatorService>();

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    if (event is LoadPosts) {
      yield* _mapLoadPostToState();
    }
  }

  Stream<FeedState> _mapLoadPostToState() async* {
    try {
      QuerySnapshot? rawData =
          await repository.readCollection(collection: 'posts');

      List<Map<String, dynamic>>? data =
          rawData?.docs.map((QueryDocumentSnapshot doc) => doc.data()).toList();

      List<Post>? posts = data
          ?.map((Map<String, dynamic> post) => Post.fromJSON(post))
          .toList();

      yield FeedState(posts: posts);
    } catch (e) {
      debugPrint('error to read post ${e.toString()}');
    }
  }
}
