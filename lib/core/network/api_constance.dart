class ApiConstance {
  static const String baseURL = "https://api.themoviedb.org/3/";
  static const String apiKey =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYTY5ZDRhOTQzNmMzM2ZjZTJiNTJhMmQ1MjQ5MTg3YSIsInN1YiI6IjY0ZDkyOTQyMzcxMDk3MDBhYzQxYzBkZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AneE7D0GAypdwu9nQWPYi9UVL2Dbx6JR3gDkYeHzS3Y";

  static const String nowPlayingMoviesPath =
      "${baseURL}movie/now_playing?language=en-US&page=1";
}
