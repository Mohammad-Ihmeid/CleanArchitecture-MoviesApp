import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_detail_model.dart';
import 'package:movies_app/movies/data/models/movies_model.dart';
import 'package:movies_app/movies/data/models/recommendations_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecases.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MovieDetailModel> getMovieDetails(MovieDetailParameters parameters);

  Future<List<RecommendationsModel>> getRecommendations(
      RecommendationsParameters parameters);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response =
        await http.get(Uri.parse(ApiConstance.nowPlayingMoviesPath), headers: {
      "Authorization": ApiConstance.apiKey,
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
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response =
        await http.get(Uri.parse(ApiConstance.popularMoviesPath), headers: {
      "Authorization": ApiConstance.apiKey,
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
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response =
        await http.get(Uri.parse(ApiConstance.topRatedMoviesPath), headers: {
      "Authorization": ApiConstance.apiKey,
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
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetails(
      MovieDetailParameters parameters) async {
    final response = await http.get(
      Uri.parse(ApiConstance.movieDetailsPath(parameters.movieId)),
      headers: {
        "Authorization": ApiConstance.apiKey,
        "accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(json.decode(response.body));
    } else {
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(
      RecommendationsParameters parameters) async {
    final response = await http.get(
      Uri.parse(ApiConstance.getRecommendationsPath(parameters.id)),
      headers: {
        "Authorization": ApiConstance.apiKey,
        "accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return List<RecommendationsModel>.from(
        (responseJson["results"] as List).map(
          (e) => RecommendationsModel.fromJson(e),
        ),
      );
    } else {
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }
}
