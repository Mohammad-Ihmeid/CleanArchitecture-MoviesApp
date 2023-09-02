import 'package:movies_app/movies/domain/entities/movies.dart';

abstract class BaseMoviesRepository {
  Future<List<Movies>> getNowPlayingMovies();
  Future<List<Movies>> getPopularMovies();
  Future<List<Movies>> getTopRatedMovies();
}
