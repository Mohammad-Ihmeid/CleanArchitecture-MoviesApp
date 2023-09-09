import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  init() {
    //Bloc
    getIt.registerFactory(() => MoviesBloc(getIt()));

    //Use Case
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCases(getIt()));

    //Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(getIt()));

    //Data Source
    getIt.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );
  }
}
