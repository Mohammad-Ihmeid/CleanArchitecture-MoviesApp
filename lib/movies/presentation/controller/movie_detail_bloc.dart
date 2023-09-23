import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movie_detail_state.dart';

part 'movie_detail_event.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailsUseCases getMovieDetailsUseCases;
  final GetRecommendationsUseCases getRecommendationsUseCases;
  MovieDetailBloc(this.getMovieDetailsUseCases, this.getRecommendationsUseCases)
      : super(const MovieDetailState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);

    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailState> emit) async {
    final result = await getRecommendationsUseCases(
        RecommendationsParameters(id: event.id));

    result.fold((l) {
      emit(state.copyWith(
        requestStateRecommendations: RequestState.error,
        recommendationsMessage: l.message,
      ));
    }, (r) {
      emit(
        state.copyWith(
          requestStateRecommendations: RequestState.loaded,
          recommendations: r,
        ),
      );
    });
  }

  FutureOr<void> _getMovieRecommendation(
      GetMovieRecommendationEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await getMovieDetailsUseCases(MovieDetailParameters(movieId: event.id));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        movieDetailMessage: l.message,
      ));
    }, (r) {
      emit(
        state.copyWith(
          requestState: RequestState.loaded,
          movieDetail: r,
        ),
      );
    });
  }
}
