import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:spark_social_media_integration/home.dart';

var userData;
late UserCredential _user;

facebookLoginData(BuildContext context) {
  facebookLogin().then((value) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return home(userData['email'], userData['name'],
          userData['picture']['data']['url']);
    }));
  });
}

facebookLogin() async {
  print("FaceBook");
  try {
    final result =
        await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
    if (result.status == LoginStatus.success) {
      userData = await FacebookAuth.i.getUserData();
      print(userData);
    }
  } catch (error) {
    print(error);
  }
}

Future<void> facebookSignOut() async {
  await FacebookAuth.instance.logOut();
  await FirebaseAuth.instance.signOut();
  // _user = null;
}
