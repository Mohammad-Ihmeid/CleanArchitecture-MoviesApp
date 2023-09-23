import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movie_detail_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  init() {
    //Bloc
    getIt.registerFactory(() => MoviesBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => MovieDetailBloc(getIt(), getIt()));

    //Use Case
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCases(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUseCases(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMoviesUseCases(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCases(getIt()));
    getIt.registerLazySingleton(() => GetRecommendationsUseCases(getIt()));
    //Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(getIt()));

    //Data Source
    getIt.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );
  }
}
