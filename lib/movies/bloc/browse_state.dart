import 'package:movies/movies/data/models/movie_model.dart';

abstract class BrowseState {}

class BrowseInitial extends BrowseState {}
class BrowseLoading extends BrowseState {}
class BrowseLoaded extends BrowseState {
  final List<MovieModel> movies;
  final Set<String> genres;

  BrowseLoaded(this.movies, this.genres);
}
class BrowseError extends BrowseState {
  final String message;
  BrowseError(this.message);
}
