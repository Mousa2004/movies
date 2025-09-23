import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/movies/data/models/movie_model.dart';

class APIService {
  static const String baseUrl = "https://yts.mx/api/v2";

  /// 🔍 البحث باسم الفيلم
  static Future<List<MovieModel>> searchMovies(String title) async {
    final response = await http.get(
      Uri.parse("$baseUrl/list_movies.json?query_term=$title"),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List movies = json['data']['movies'] ?? [];
      return movies.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      throw Exception('فشل في البحث: ${response.statusCode}');
    }
  }
}
