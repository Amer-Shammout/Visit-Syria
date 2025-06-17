import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleSignInMethods {
  static Future<String?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(
          serverClientId:
              '889846115507-5550gld1at7iba6a7ua7nb3g4b2a2rmg.apps.googleusercontent.com',
        ).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    log(
      '${googleAuth?.accessToken} \n ${googleUser?.displayName} \n ${googleAuth?.idToken}',
    );

    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);
    return googleAuth?.idToken;
  }
}
