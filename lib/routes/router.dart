import 'package:flutter/material.dart';
import 'package:fluttergram/screens/home.dart';
import 'package:fluttergram/screens/auth/login_view.dart';
import 'package:fluttergram/screens/walkthrough/walkthrough_view.dart';

class UIRouter {
  static String initialRoute = LoginView.route;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, Route<dynamic>> appRouting = <String, Route<dynamic>>{
      HomePage.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: settings.name),
        builder: (_) => HomePage(),
      ),
      LoginView.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: settings.name),
        builder: (_) => LoginView(),
      ),
      WalkthroughView.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: settings.name),
        builder: (_) => WalkthroughView(),
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
