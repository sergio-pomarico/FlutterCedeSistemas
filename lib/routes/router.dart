import 'package:flutter/material.dart';
import 'package:fluttergram/screens/home.dart';
import 'package:fluttergram/screens/login.dart';

class UIRouter {
  static String initialRoute = HomePage.route;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, Route<dynamic>> appRouting = <String, Route<dynamic>>{
      HomePage.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: settings.name),
        builder: (_) => HomePage(),
      ),
      LoginPage.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: settings.name),
        builder: (_) => LoginPage(),
      )
    };

    return appRouting[settings.name] ??
        MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route not found ${settings.name}'),
            ),
          ),
        );
  }
}
