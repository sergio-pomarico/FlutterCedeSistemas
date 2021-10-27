import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

class LoginView extends StatefulWidget {
  static String route = 'login';

  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
              fontSize: getProportionsScreenHeigth(14), color: secondaryColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        // Bloquear el scroll superior
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'Welcome Back',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: getProportionsScreenHeigth(28),
              ),
            ),
            Text(
              'Sign in with your email and password  \nor continue with social media',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 390,
            )
          ],
        ),
      ),
    );
  }
}
