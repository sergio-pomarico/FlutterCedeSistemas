part of app.auth;

class LoginView extends StatefulWidget {
  static String route = 'login';

  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? passwordError;

  void onValidatePass(String value) {
    setState(() {
      value.length >= 6
          ? passwordError = null
          : passwordError = 'password is too short';
    });
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                height: SizeConfig.screenHeight! * 0.05,
              ),
              Input(
                label: 'email',
                icon: Icons.email_outlined,
                controller: emailController,
                placeholder: 'add your email',
                onChange: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              Input(
                label: 'password',
                icon: Icons.lock_outlined,
                controller: passwordController,
                placeholder: 'add your password',
                error: passwordError,
                onChange: onValidatePass,
                isPassword: true,
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (_) {},
                        activeColor: primaryColor,
                      ),
                      Text('Remember me'),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      print('tap on link');
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              Button(
                label: 'Sing In',
                onPress: () {
                  print('email ${emailController.text}');
                  print('password ${passwordController.text}');
                },
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SocialButton(
                    icon: 'assets/icons/google.svg',
                    onPress: () {
                      print('google');
                    },
                  ),
                  SocialButton(
                    icon: 'assets/icons/facebook.svg',
                    onPress: () {
                      print('facebook');
                    },
                  ),
                  SocialButton(
                    icon: 'assets/icons/twitter.svg',
                    onPress: () {
                      print('facebook');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account? ",
                  ),
                  InkWell(
                    onTap: () {
                      print('tap on link');
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: primaryColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
