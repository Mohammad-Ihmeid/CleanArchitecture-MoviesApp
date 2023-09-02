import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCases {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCases(this.baseMoviesRepository);

  Future<List<Movies>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
