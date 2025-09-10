import 'package:equatable/equatable.dart';
import 'package:movies/movies/data/models/MovieModel.dart';


abstract class MoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<MovieModel> latestMovies;
  final List<MovieModel> categoryMovies;
  final String currentCategory;
  final int currentCategoryIndex;

  MoviesLoaded({
    required this.latestMovies,
    required this.categoryMovies,
    required this.currentCategory,
    required this.currentCategoryIndex
  });

  @override
  List<Object?> get props =>
      [latestMovies, categoryMovies, currentCategory, currentCategoryIndex];
}

class MoviesError extends MoviesState {
  final String message;

  MoviesError(this.message);

  @override
  List<Object?> get props => [message];
}
