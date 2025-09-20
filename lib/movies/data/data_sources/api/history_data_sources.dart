import 'package:movies/movies/data/models/movie_model.dart';

class HistoryDataSources {
  final List<MovieModel> _history = [];
  List<MovieModel> addMovieToHistory(MovieModel movie) {
    if (!_history.contains(movie)) {
      _history.add(movie);
    }
    return _history;
  }

  List<MovieModel> getMovieFromHistory() {
    return _history;
  }
}
