import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCases {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCases(this.baseMoviesRepository);

  Future<Either<Failure, List<Movies>>> execute() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
