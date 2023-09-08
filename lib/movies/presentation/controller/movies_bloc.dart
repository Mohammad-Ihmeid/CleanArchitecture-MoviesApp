import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
          MoviesRemoteDataSource();
      BaseMoviesRepository moviesRepository =
          MoviesRepository(baseMoviesRemoteDataSource);
      final result =
          await GetNowPlayingMoviesUseCases(moviesRepository).execute();

      emit(const MoviesState(nowPlayingState: RequestState.loaded));

      result.fold((l) {
        emit(
          MoviesState(
            nowPlayingState: RequestState.error,
            message: l.message,
          ),
        );
      }, (r) {
        emit(MoviesState(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: r,
        ));
      });
    });
  }
}
