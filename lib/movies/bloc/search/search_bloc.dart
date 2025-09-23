import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/bloc/search/search_event.dart';
import 'package:movies/movies/bloc/search/search_state.dart';
import 'package:movies/movies/data/data_sources/api/api_service.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
    SearchBloc() : super(SearchInitial()) {
        on<SearchMoviesEvent>(_onSearchMovies);
    }

    Future<void> _onSearchMovies(
        SearchMoviesEvent event, Emitter<SearchState> emit) async {
        try {
            emit(SearchLoading());

            final movies = await APIService.searchMovies(event.query);

            emit(SearchLoaded(movies));
        } catch (e) {
            emit(SearchError("Failed to search movies: $e"));
        }
    }
}
