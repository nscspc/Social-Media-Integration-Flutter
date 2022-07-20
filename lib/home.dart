import 'package:flutter/material.dart';
import 'package:spark_social_media_integration/Screens/Login/components/login_form.dart';
import 'package:spark_social_media_integration/Screens/Login/login_screen.dart';
import 'package:spark_social_media_integration/Screens/Welcome/components/login_signup_btn.dart';
import 'package:spark_social_media_integration/Screens/Welcome/components/welcome_image.dart';
import 'package:spark_social_media_integration/components/background.dart';
import 'package:spark_social_media_integration/constants.dart';
import 'package:spark_social_media_integration/facebook_login.dart';
import 'package:spark_social_media_integration/google_login.dart';
import 'package:spark_social_media_integration/responsive.dart';

class home extends StatefulWidget {
  String? email, name, photoUrl;

  home(this.email, this.name, this.photoUrl);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Image(image: NetworkImage(widget.photoUrl.toString())),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: LoginAndSignupBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile:
                MobileWelcomeScreen(widget.name, widget.email, widget.photoUrl),
          ),
        ),
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  String? name, email, photoUrl;
  MobileWelcomeScreen(this.name, this.email, this.photoUrl);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 15),
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(75),
            color: kPrimaryColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                photoUrl.toString(),
              ),
              // fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 0.5,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kPrimaryLightColor,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                name.toString(),
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 0.5,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kPrimaryLightColor,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
              child: Text(
                email.toString(),
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Hero(
                tag: "login_btn",
                child: Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      signOutGoogle();
                      facebookSignOut();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Signout".toUpperCase(),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
