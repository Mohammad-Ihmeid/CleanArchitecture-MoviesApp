import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCases getNowPlayingMoviesUseCases;

  MoviesBloc(this.getNowPlayingMoviesUseCases) : super(const MoviesState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCases.execute();
      print(result);
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
