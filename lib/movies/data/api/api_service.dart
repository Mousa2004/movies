import 'dart:convert';
import 'package:http/http.dart' as http show get;
import 'package:movies/movies/data/api/api_constant.dart';
import 'package:movies/movies/data/models/MovieModel.dart';

class APIService {
  static Future<List<MovieModel>> getMovies() async {
    Uri uri = Uri.https(APIConstance.baseURL, APIConstance.listEndpoint);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List movies = json["data"]["movies"];
      return movies.map((m) => MovieModel.fromJson(m)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  static Future<List<MovieModel>> getMoviesByGenre(String genre) async {
    Uri uri = Uri.https(APIConstance.baseURL, APIConstance.listEndpoint, {
      "genre": genre,
    });
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List movies = json["data"]["movies"];
      return movies.map((m) => MovieModel.fromJson(m)).toList();
    } else {
      throw Exception("Failed to load movies by genre");
    }
  }
}
