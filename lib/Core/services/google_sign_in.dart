import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleSignInMethods {
  static Future<String?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(
          serverClientId:
              '889846115507-5550gld1at7iba6a7ua7nb3g4b2a2rmg.apps.googleusercontent.com',
        ).signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    log(
      '${googleAuth?.accessToken} \n ${googleUser?.displayName} \n ${googleAuth?.idToken}',
    );

    return googleAuth?.idToken;
  }
}
