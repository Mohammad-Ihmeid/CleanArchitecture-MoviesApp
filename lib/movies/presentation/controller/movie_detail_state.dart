// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState requestState;
  final String movieDetailMessage;
  final List<Recommendations> recommendations;
  final RequestState requestStateRecommendations;
  final String recommendationsMessage;

  const MovieDetailState({
    this.movieDetail,
    this.requestState = RequestState.loading,
    this.movieDetailMessage = '',
    this.recommendations = const [],
    this.requestStateRecommendations = RequestState.loading,
    this.recommendationsMessage = '',
  });

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    RequestState? requestState,
    String? movieDetailMessage,
    List<Recommendations>? recommendations,
    RequestState? requestStateRecommendations,
    String? recommendationsMessage,
  }) {
    return MovieDetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      requestState: requestState ?? this.requestState,
      movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
      recommendations: recommendations ?? this.recommendations,
      requestStateRecommendations:
          requestStateRecommendations ?? this.requestStateRecommendations,
      recommendationsMessage:
          recommendationsMessage ?? this.recommendationsMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        requestState,
        movieDetailMessage,
        recommendations,
        requestStateRecommendations,
        recommendationsMessage,
      ];
}
