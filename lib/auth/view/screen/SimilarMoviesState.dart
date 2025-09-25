import 'package:movies/movies/data/models/movie_model.dart';

abstract class SimilarMoviesState {}

class SimilarMoviesInitial extends SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<MovieModel> movies;

  SimilarMoviesLoaded(this.movies);
}

class SimilarMoviesError extends SimilarMoviesState {
  final String message;

  SimilarMoviesError(this.message);
}
