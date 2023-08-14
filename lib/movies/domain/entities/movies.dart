class Movies {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIDs;
  final String overview;
  final double voteAverage;

  Movies({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIDs,
    required this.overview,
    required this.voteAverage,
  });
}
