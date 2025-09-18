import '../../../movies/data/data_sources/api/api_service.dart';
import '../../../movies/data/models/movie_model.dart';

class MoviesRepository {
  Future<List<MovieModel>> getSimilarMovies(int movieId) async {
    try {
      final movies = await APIService.getSimilarMovies(movieId);
      return movies;
    } catch (e) {
      throw Exception("Failed to load similar movies: $e");
    }
  }
}
