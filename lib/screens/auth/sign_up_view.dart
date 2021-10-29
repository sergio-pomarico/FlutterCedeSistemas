part of app.auth;

class SignUpView extends StatefulWidget {
  static String route = 'signup';

  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
          'Register',
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
                'Register Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionsScreenHeigth(28),
                ),
              ),
              Text(
                'Complete your details or continue\nwith social media',
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
              Input(
                label: 'confirm password',
                icon: Icons.lock_outlined,
                controller: passwordController,
                placeholder: 'repeat your password',
                error: passwordError,
                onChange: onValidatePass,
                isPassword: true,
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
                      print('twitter');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: getProportionsScreenHeigth(24),
              ),
              Text(
                'By continuing your confirm that you agree \nwith our Term and Condition',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
