import 'package:movies/movies/data/models/movie_model.dart';

class WatchListDataSources {
  final List<MovieModel> _watchList = [];

  List<MovieModel> addMovieToWatchList(MovieModel movie) {
    if (!_watchList.contains(movie)) {
      _watchList.add(movie);
    }
    return _watchList;
  }

  List<MovieModel> getWatchList() {
    return _watchList;
  }
}
