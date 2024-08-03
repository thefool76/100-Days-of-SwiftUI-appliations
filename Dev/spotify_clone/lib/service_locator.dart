import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth_repo.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initilizeDependecies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepo>(AuthRepoImpl());

   sl.registerSingleton<SignupUseCase>(SignupUseCase());

   sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
