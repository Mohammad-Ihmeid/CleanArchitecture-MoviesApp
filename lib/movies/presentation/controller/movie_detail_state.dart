// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState requestState;
  final String movieDetailMessage;

  const MovieDetailState({
    this.movieDetail,
    this.requestState = RequestState.loading,
    this.movieDetailMessage = '',
  });

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    RequestState? requestState,
    String? movieDetailMessage,
  }) {
    return MovieDetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      requestState: requestState ?? this.requestState,
      movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        requestState,
        movieDetailMessage,
      ];
}
