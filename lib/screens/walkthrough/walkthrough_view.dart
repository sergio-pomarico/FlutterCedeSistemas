import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fluttergram/ui_shared/size_config.dart';
//import 'package:fluttergram/ui_shared/image.dart';

List<Map<String, String>> sliderData = <Map<String, String>>[
  {
    "text": "Welcome to fluttergram",
    "image": "assets/images/friends.svg",
  },
  {
    "text": "We help people to connect with friends\n arround the world",
    "image": "assets/images/love.svg"
  },
  {
    "text": "Meet interesting people\n and interact with them",
    "image": "assets/images/vacations.svg"
  }
];

class WalkthroughView extends StatefulWidget {
  static String route = 'walkthrough';

  _WalkthroughViewState createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends State<WalkthroughView> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                itemCount: sliderData.length,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    Spacer(),
                    Text(
                      'FLUTTERGRAM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getProportionsScreenHeigth(24),
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: getProportionsScreenHeigth(16),
                    ),
                    Text(
                      sliderData[index]['text'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getProportionsScreenHeigth(18),
                      ),
                    ),
                    SizedBox(
                      height: getProportionsScreenHeigth(16),
                    ),
                    // SvgPicture.asset(
                    //   sliderData[index]['image'] as String,
                    //   width: getProportionsScreenWidth(320),
                    //   height: getProportionsScreenHeigth(240),
                    //   fit: BoxFit.cover,
                    // ),
                  ],
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionsScreenWidth(24),
                ),
                child: Column(
                  children: <Widget>[
                    ///Indicadores
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        sliderData.length,
                        (index) => buildDot(index),
                      ),
                    )
                  ],
                ),
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) => AnimatedContainer(
        alignment: Alignment.center,
        duration: Duration(milliseconds: 500),
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: index == pageIndex ? 20 : 6,
        decoration: BoxDecoration(
          color: index == pageIndex ? primaryColor : secondaryColor,
          borderRadius: BorderRadius.circular(3),
        ),
      );
}
