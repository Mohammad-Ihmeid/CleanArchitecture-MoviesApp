import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCases extends BaseUseCase<List<Movies>> {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCases(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movies>>> call() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
