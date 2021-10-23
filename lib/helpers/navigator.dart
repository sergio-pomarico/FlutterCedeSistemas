import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  void push({required String route, dynamic params}) {
    navigatorKey.currentState?.pushNamed(route, arguments: params);
  }
}
