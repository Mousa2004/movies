import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/data/api/api_service.dart';
import 'movies_state.dart';

class MoviesBloc extends Cubit<MoviesState> {
  MoviesBloc() : super(MoviesInitial());

  final List<String> categories = [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
    "Film-Noir",
    "Game-Show",
    "History",
    "Horror",
    "Music",
    "Musical",
    "Mystery",
    "News",
    "Reality-TV",
    "Romance",
    "Sci-Fi",
    "Short",
    "Sport",
    "Talk-Show",
    "Thriller",
    "War",
    "Western",
  ];
  int currentCategoryIndex = 0;

  Future<void> loadMovies() async {
    try {
      emit(MoviesLoading());

      final latest = await APIService.getMovies();


      final category = categories[currentCategoryIndex];
      final categoryMovies = await APIService.getMoviesByGenre(category);


      emit(MoviesLoaded(
        latestMovies: latest,
        categoryMovies: categoryMovies,
        currentCategory: category,
      ));


      currentCategoryIndex =
          (currentCategoryIndex + 1) % categories.length; // يلف بينهم

    } catch (e) {
      emit(MoviesError("Failed to load movies: $e"));
    }
  }
}
