// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final String id;
  final String overview;
  final String releaseDate;
  final int runTime;
  final String title;
  final String voteAverage;

  const MovieDetail({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object> get props {
    return [
      backdropPath,
      genres,
      id,
      overview,
      releaseDate,
      runTime,
      title,
      voteAverage,
    ];
  }
}
