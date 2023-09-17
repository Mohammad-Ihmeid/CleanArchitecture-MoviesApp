import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCases getNowPlayingMoviesUseCases;
  final GetPopularMoviesUseCases getPopularMoviesUseCases;
  final GetTopRatedMoviesUseCases getTopRatedMoviesUseCases;

  MoviesBloc(this.getNowPlayingMoviesUseCases, this.getPopularMoviesUseCases,
      this.getTopRatedMoviesUseCases)
      : super(const MoviesState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCases.execute();

      result.fold((l) {
        emit(state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ));
      }, (r) {
        emit(
          state.copyWith(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: r,
          ),
        );
      });
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCases.execute();
      result.fold((l) {
        emit(
          state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message,
          ),
        );
      }, (r) {
        emit(state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        ));
      });
    });
  }
}
