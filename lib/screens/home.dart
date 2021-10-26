import 'package:flutter/material.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/screens/login.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

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
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home',
              style: TextStyle(
                fontSize: getProportionsScreenHeigth(16),
              ),
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
