import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usercase/usecase.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUser> {
  @override
  Future<Either> call({CreateUser ? params}) {
    return sl<AuthRepo>().signup(params!);
  }
}
