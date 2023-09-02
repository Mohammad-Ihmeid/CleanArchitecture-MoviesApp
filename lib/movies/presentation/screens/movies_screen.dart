import 'package:flutter/material.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecases.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movies> movies = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

void _getData() async {
  BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
      MoviesRemoteDataSource();
  BaseMoviesRepository moviesRepository =
      MoviesRepository(baseMoviesRemoteDataSource);
  final result = await GetNowPlayingMoviesUseCases(moviesRepository).execute();

  result.fold((l) => null, (r) {});

  print(result);
}
