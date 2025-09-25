import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/data/data_sources/api/api_service.dart';
import 'package:movies/movies/data/models/movie_model.dart' show MovieModel;

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  Future<void> fetchMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());
    try {
      final movie = await APIService.getMovieDetails(movieId);
      if (movie != null) {
        emit(MovieDetailsLoaded(movie));
      } else {
        emit(MovieDetailsError("No movie details found"));
      }
    } catch (e) {
      emit(MovieDetailsError("Failed to fetch movie details: $e"));
    }
  }
}
