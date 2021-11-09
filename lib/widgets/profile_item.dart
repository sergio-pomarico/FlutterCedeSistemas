import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/image.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  final String text, icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
          primary: primaryColor,
        ),
        onPressed: onPress,
        child: Row(
          children: [
            ImageFactory.svg(
              icon,
              color: primaryColor,
              width: 22,
              height: 22,
            ),
            SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 18),
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
