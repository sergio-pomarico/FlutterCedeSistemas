import 'package:flutter/material.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/screens/login.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static String route = 'home';

  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePage> {
  final NavigatorService navigator = locator<NavigatorService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home',
            ),
            ElevatedButton(
              onPressed: () {
                navigator.push(route: LoginPage.route);
              },
              child: Text('Ir a Login'),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
