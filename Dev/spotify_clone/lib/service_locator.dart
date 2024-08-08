import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth_repo.dart';
import 'package:spotify_clone/data/repository/song/song_repository_implementation.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/domain/usecases/song/get_news_songs.dart';

import 'data/sources/song/song_firebase_service.dart';

final sl = GetIt.instance;

Future<void> initilizeDependecies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepo>(AuthRepoImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<SongRepository>(SongRepositoryImplementation());

  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
}
