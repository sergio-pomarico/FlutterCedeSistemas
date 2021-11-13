library bloc.feed;

// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/repository/database_repository.dart';
import 'package:fluttergram/repository/storage_repository.dart';
import 'package:fluttergram/screens/home/home_view.dart';
import 'package:image_picker/image_picker.dart';

part './feed_state.dart';
part './feed_events.dart';

class FeedBLoC extends Bloc<FeedEvent, FeedState> {
  FeedBLoC() : super(FeedState());

  final DataBaseRepository repository = locator<DataBaseRepository>();
  final NavigatorService navigator = locator<NavigatorService>();
  final StorageRepository storage = locator<StorageRepository>();

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    if (event is LoadPosts) {
      yield* _mapLoadPostToState();
    } else if (event is CreatePost) {
      yield* _mapCreatePostToState(image: event.image, content: event.content);
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

  Stream<FeedState> _mapCreatePostToState(
      {required String content, required XFile? image}) async* {
    try {
      String path = 'posts/${image?.name}';
      await storage.uploadFile(path: path, filePath: image?.path ?? '');
      String? url = await storage.getDownloadURL(file: path);
      await repository.add(collection: 'posts', data: {
        'author': 'Sergio', //TODO leer el nombre del usuario
        'content': content,
        'photo': url,
        'profileURL': url,
      });
      navigator.replace(
          route: TimelineView.route, key: navigator.homeNavigatorKey);
    } catch (e) {
      debugPrint('error to read post ${e.toString()}');
    }
  }
}
