part of app.home;

class ProfileView extends StatelessWidget {
  static String route = '${HomeView.route}/profile';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('profile_view'),
      appBar: AppBar(
        title: Text(
          "Profile",
          textAlign: TextAlign.center,
        ),
        leading: SizedBox(),
      ),
      bottomNavigationBar: BottomNavbar(currentPage: MenuPage.home),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight! * 0.05),
            Center(
              child: SizedBox(
                height: getProportionsScreenHeigth(128),
                width: getProportionsScreenWidth(136),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SizedBox(
                      height: getProportionsScreenHeigth(128),
                      width: getProportionsScreenWidth(128),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF5F6F9),
                        ),
                        child: Icon(
                          Icons.photo_rounded,
                          color: textColor,
                          size: 48,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 4,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Color(0xFFF5F6F9),
                          ),
                          child: Icon(
                            Icons.add_a_photo,
                            color: textColor,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.05),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/user.svg",
              onPress: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/bell.svg",
              onPress: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/settings.svg",
              onPress: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/question.svg",
              onPress: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/logout.svg",
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
