import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

class Post extends StatelessWidget {
  Post(
      {required this.author,
      required this.content,
      required this.postURL,
      required this.profileURL,
      key})
      : super(key: key);

  final String author;
  final String profileURL;
  final String postURL;
  final String content;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
        width: constraints.maxWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: getProportionsScreenWidth(48),
                        height: getProportionsScreenHeigth(48),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(profileURL),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        author,
                        style: TextStyle(color: textColor, fontSize: 18),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getProportionsScreenHeigth(20),
                  ),
                  SizedBox(
                    width: constraints.maxWidth,
                    height: getProportionsScreenHeigth(240),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(postURL),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionsScreenHeigth(20),
                  ),
                  Text(
                    content,
                    style: TextStyle(color: textColor, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
