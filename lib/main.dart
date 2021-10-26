import 'package:flutter/material.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/routes/router.dart';
import 'package:fluttergram/ui_shared/theme.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigatorService navigator = locator<NavigatorService>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      navigatorKey: navigator.navigatorKey,
      initialRoute: UIRouter.initialRoute,
      onGenerateRoute: UIRouter.generateRoute,
    );
  }
}
