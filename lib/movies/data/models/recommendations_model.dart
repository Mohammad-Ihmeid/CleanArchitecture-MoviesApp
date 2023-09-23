import 'package:movies_app/movies/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({super.backdropPath, required super.id});

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(
        backdropPath:
            json["backdrop_path"] ?? "/w2nFc2Rsm93PDkvjY4LTn17ePO0.jpg",
        id: json["id"],
      );
}
