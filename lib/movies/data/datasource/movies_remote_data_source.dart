import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movies_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();
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
}
