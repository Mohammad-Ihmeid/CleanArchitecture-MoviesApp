import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUseCases {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCases(this.baseMoviesRepository);

  Future<List<Movies>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
