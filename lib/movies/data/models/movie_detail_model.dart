import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        backdropPath: json["backdrop_path"],
        genres: List<GenresModel>.from(json["genres"].map(
          (x) => GenresModel.fromJson(x),
        )),
        id: json["id"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        runTime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"],
      );
}
