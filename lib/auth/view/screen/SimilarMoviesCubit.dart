import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/data/data_sources/api/api_service.dart';

import 'SimilarMoviesState.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesInitial());

  Future<void> fetchSimilarMovies(int movieId) async {
    try {
      emit(SimilarMoviesLoading());
      final List<MovieModel> movies = await APIService.getSimilarMovies(movieId);
      emit(SimilarMoviesLoaded(movies));
    } catch (e) {
      emit(SimilarMoviesError(e.toString()));
    }
  }
}
