import 'package:authentication/view/google_button.dart';
import 'package:authentication/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication{

StreamBuilder  handleAuthState() {
  return StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const GoogleButton();
        }
      }
  );
}

Future<void> googleSignIn() async {
  try{
    final GoogleSignInAccount? googleSignIn = await GoogleSignIn(
        scopes: <String>['email']).signIn();

    final GoogleSignInAuthentication googleAuth = await googleSignIn!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print(credential.secret);
  }catch (e) {
    print(e.toString());
  }

}

Future<void> signOut() async {
  FirebaseAuth.instance.signOut();
}

}