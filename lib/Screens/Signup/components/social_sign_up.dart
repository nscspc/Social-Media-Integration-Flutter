import 'package:flutter/material.dart';
import 'package:spark_social_media_integration/facebook_login.dart';
import 'package:spark_social_media_integration/google_login.dart';

import '../../../screens/Signup/components/or_divider.dart';
import '../../../screens/Signup/components/social_icon.dart';

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocalIcon(
              iconSrc: "assets/icons/facebook.svg",
              press: () {
                facebookLoginData(context);
              },
            ),
            // SocalIcon(
            //   iconSrc: "assets/icons/twitter.svg",
            //   press: () {},
            // ),
            SocalIcon(
              iconSrc: "assets/icons/google-plus.svg",
              press: () {
                googleLoginData(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
