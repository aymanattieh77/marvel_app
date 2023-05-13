import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_app/shared/services/auth/auth_error.dart';

Future<Either<AuthFailure, UserCredential>> registerOrLogin(
    String email, String password, bool isUserLogin) async {
  final instance = FirebaseAuth.instance;
  try {
    if (isUserLogin) {
      return Right(
        await instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
    } else {
      return Right(
        await instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
    }
  } on FirebaseAuthException catch (e) {
    return Left(AuthFailure(e.code));
  } catch (e) {
    return Left(AuthFailure(e.toString()));
  }
}

User? getUserProfile() {
  final user = FirebaseAuth.instance.currentUser;

  return user;
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
