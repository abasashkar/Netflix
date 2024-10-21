import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:netflix_app/models/tvseries_models.dart';
import 'package:netflix_app/models/upcoming_models.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=${dotenv.env['apikey']}";

late String endpoints;

class ApiServices {
  Future<UpcomingMovieModel> getupcomingMoviemodel() async {
    endpoints = "movie/upcoming";
    final url = "$baseUrl$endpoints$key";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("success");

        return UpcomingMovieModel.fromJson(jsonDecode(response.body));
      } else {
        log("Error: Status Code ${response.statusCode}");
        throw Exception("Failed to load upcoming Moviess");
      }
    } catch (e) {
      log("Exception occurred: $e");
      throw Exception("Failed to load upcoming Movies");
    }
  }

  Future<UpcomingMovieModel> getnowPlaying() async {
    endpoints = "movie/now_playing";
    final url = "$baseUrl$endpoints$key";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("success");

        return UpcomingMovieModel.fromJson(jsonDecode(response.body));
      } else {
        log("Error: Status Code ${response.statusCode}");
        throw Exception("Failed to load now playing Moviess");
      }
    } catch (e) {
      log("Exception occurred: $e");
      throw Exception("Failed to load now playing g Movies");
    }
  }

  Future<TvseriesModel> gettvseriesPlaying() async {
    endpoints = "tv/top_rated";
    final url = "$baseUrl$endpoints$key";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("success");

        return TvseriesModel.fromJson(jsonDecode(response.body));
      } else {
        log("Error: Status Code ${response.statusCode}");
        throw Exception("Failed to load  tv series");
      }
    } catch (e) {
      log("Exception occurred: $e");
      throw Exception("Failed to load tv series");
    }
  }
}
