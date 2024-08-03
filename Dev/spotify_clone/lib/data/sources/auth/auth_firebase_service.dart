import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/data/models/auth/signin_user.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUser createUser);
  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);

      return const Right("Signin was success");
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == "invalid-email") {
        message = 'Wrong Email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Password is Wrong';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUser createUser) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUser.email, password: createUser.password);
      return const Right("Signup was success");
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == "weak-password") {
        message = 'The password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = ' An account already exist with that email.';
      }
      return Left(message);
    }
  }
}
