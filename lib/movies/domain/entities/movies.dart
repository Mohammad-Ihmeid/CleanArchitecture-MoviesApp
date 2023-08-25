// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIDs;
  final String overview;
  final double voteAverage;

  const Movies({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIDs,
    required this.overview,
    required this.voteAverage,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      backdropPath,
      genreIDs,
      overview,
      voteAverage,
    ];
  }
}
