import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/movies/data/models/movie_model.dart';

class APIService {
  static const String baseUrl = "https://yts.mx/api/v2";

  /// 📌 الأفلام الأحدث
  static Future<List<MovieModel>> getMovies() async {
    final response = await http.get(
      Uri.parse("$baseUrl/list_movies.json?sort_by=date_added"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List movies = data['data']['movies'] ?? [];
      return movies.map((m) => MovieModel.fromJson(m)).toList();
    } else {
      throw Exception("Failed to load latest movies");
    }
  }

  /// 📌 الأفلام حسب التصنيف (genre)
  static Future<List<MovieModel>> getMoviesByGenre(String genre) async {
    final response = await http.get(
      Uri.parse("$baseUrl/list_movies.json?genre=$genre&sort_by=year"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List movies = data['data']['movies'] ?? [];
      return movies.map((m) => MovieModel.fromJson(m)).toList();
    } else {
      throw Exception("Failed to load movies for genre $genre");
    }
  }
}
