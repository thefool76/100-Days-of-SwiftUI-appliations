import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usercase/usecase.dart';
import 'package:spotify_clone/data/models/auth/signin_user.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq ? params}) {
    return sl<AuthRepo>().signin(params!);
  }
}
