import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';

String? name;
String? email;
String? imageUrl;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

googleLoginData(BuildContext context) {
  signInWithGoogle().then((value) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return home(email, name, imageUrl);
    }));
  });
}

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

  AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  UserCredential authResult = await _auth.signInWithCredential(credential);
  final User? user = authResult.user;

  assert(user!.email != null);
  assert(user!.displayName != null);
  assert(user!.photoURL != null);

  name = user!.displayName;
  email = user.email;
  imageUrl = user.photoURL;

  final User? currentUser = await _auth.currentUser;
  assert(user.uid == currentUser!.uid);

  return 'signInWithGoogle succeeded : $user';
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Sign Out");
}
