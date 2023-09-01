import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/movies/data/models/movies_model.dart';

class MoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1"),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYTY5ZDRhOTQzNmMzM2ZjZTJiNTJhMmQ1MjQ5MTg3YSIsInN1YiI6IjY0ZDkyOTQyMzcxMDk3MDBhYzQxYzBkZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AneE7D0GAypdwu9nQWPYi9UVL2Dbx6JR3gDkYeHzS3Y",
          "accept": "application/json",
        });

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return List<MoviesModel>.from(
        (responseJson["results"] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      return [];
    }
  }
}
