import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
