// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCases
    extends BaseUseCase<MovieDetail, MovieDetailParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCases(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailParameters extends Equatable {
  final int movieId;

  const MovieDetailParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
