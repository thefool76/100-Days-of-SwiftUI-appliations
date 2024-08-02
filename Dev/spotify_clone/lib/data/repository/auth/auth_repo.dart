import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class AuthRepoImpl extends AuthRepo {


  
  @override
  Future<void> signin() {
    throw UnimplementedError();
  }

    @override
  Future<void> signup(CreateUser createUserReq) async {
    await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
