import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/data/data_sources/api/api_service.dart';
import 'browse_state.dart';

class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit() : super(BrowseInitial());

  Future<void> fetchMovies() async {
    emit(BrowseLoading());
    try {
      final movies = await APIService.getMovies();
      final genres = <String>{};

      for (var movie in movies) {
        if (movie.genres != null) {
          genres.addAll(movie.genres!);
        }
      }

      emit(BrowseLoaded(movies, genres));
    } catch (error) {
      emit(BrowseError(error.toString()));
    }
  }
}
