class ApiConstance {
  static const String baseURL = "https://api.themoviedb.org/3/";
  static const String apiKey =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYTY5ZDRhOTQzNmMzM2ZjZTJiNTJhMmQ1MjQ5MTg3YSIsInN1YiI6IjY0ZDkyOTQyMzcxMDk3MDBhYzQxYzBkZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AneE7D0GAypdwu9nQWPYi9UVL2Dbx6JR3gDkYeHzS3Y";

  static const String nowPlayingMoviesPath =
      "${baseURL}movie/now_playing?language=en-US&page=1";

  static const String popularMoviesPath =
      "${baseURL}movie/popular?language=en-US&page=1";

  static const String topRatedMoviesPath =
      "${baseURL}movie/top_rated?language=en-US&page=1";

  static String movieDetailsPath(int movieId) => "${baseURL}movie/$movieId";

  static String getRecommendationsPath(int id) =>
      "${baseURL}movie/$id/recommendations";

  static const String baseImageURL = "https://image.tmdb.org/t/p/w500";

  static String imageURL(String path) => "$baseImageURL$path";
}
