import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

// ==================== Movie Model ====================
class Movie {
  final String title;
  final String posterPath;
  final double voteAverage;
  final List<String> genres;

  Movie({
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    required this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json, Map<int, String> genreMap) {
    return Movie(
      title: json['title'] ?? '',
      posterPath: "https://image.tmdb.org/t/p/w500${json['poster_path']}",
      voteAverage: (json['vote_average'] as num).toDouble(),
      genres: (json['genre_ids'] as List)
          .map((id) => genreMap[id] ?? '')
          .where((g) => g.isNotEmpty)
          .toList(),
    );
  }
}

// ==================== States ====================
abstract class BrowseState {}

class BrowseLoading extends BrowseState {}

class BrowseLoaded extends BrowseState {
  final List<String> genres;
  final List<Movie> movies;

  BrowseLoaded({required this.genres, required this.movies});
}

class BrowseError extends BrowseState {
  final String message;
  BrowseError(this.message);
}

// ==================== Cubit ====================
class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit() : super(BrowseLoading());

  Future<void> fetchMovies() async {
    try {
      final dio = Dio();
      const apiKey = "YOUR_TMDB_API_KEY"; // <<< حط الـ API KEY بتاعك هنا

      // 1- تجيب كل الـ genres
      final genreResponse = await dio.get(
        "https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey",
      );

      final Map<int, String> genreMap = {
        for (var g in genreResponse.data['genres'] as List)
          (g['id'] as int): g['name'] as String
      };

      // 2- تجيب الأفلام
      final response = await dio.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey",
      );

      final movies = (response.data['results'] as List)
          .map((json) => Movie.fromJson(json as Map<String, dynamic>, genreMap))
          .toList();

      emit(BrowseLoaded(
        genres: genreMap.values.toList(),
        movies: movies,
      ));
    } catch (e) {
      emit(BrowseError(e.toString()));
    }
  }

}
