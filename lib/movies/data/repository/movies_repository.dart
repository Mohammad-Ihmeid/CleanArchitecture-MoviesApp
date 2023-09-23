import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecases.dart';

class MoviesRepository extends BaseMoviesRepository {
  BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;
  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailParameters parameters) async {
    final result = await baseMoviesRemoteDataSource.getMovieDetails(parameters);

    try {
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
