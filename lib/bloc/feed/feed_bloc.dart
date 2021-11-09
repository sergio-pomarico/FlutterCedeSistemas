library bloc.auth;

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/repository/auth_repository.dart';

part 'feed_state.dart';
part 'feed_events.dart';

class FeedBLoC extends Bloc<FeedEvent, FeedState> {
  FeedBLoC() : super(FeedState());

  final AuthRepository repository = locator<AuthRepository>();
  final NavigatorService navigator = locator<NavigatorService>();

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    if (event is LoadPost) {
      yield* _mapLoadPostToState();
    }
  }

  Stream<FeedState> _mapLoadPostToState() async* {}
}
