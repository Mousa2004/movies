import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/bloc/watch_list_state.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/data/repositories/watch_list_repository.dart';
import 'package:movies/shared/view/widget/Service_locator.dart';

final watchListRepository = WatchListRepository(
  ServiceLocator.watchListDataSources,
);

class WatchListBloc extends Cubit<WatchListState> {
  WatchListBloc() : super(InitialWatchList());

  void addMovie(MovieModel movie) async {
    emit(WatchListLoading());
    try {
      final updatedList = watchListRepository.addMovieToWatchList(movie);
      emit(WatchListSuccess(await updatedList));
    } catch (e) {
      emit(WatchListError(message: "Failed to loade movie list"));
    }
  }

  void getWatchList() async {
    emit(WatchListSuccess(await watchListRepository.getWatchList()));
  }

  Future<int> getWatchListCount() async {
    final movies = await watchListRepository.getWatchList();
    return movies.length;
  }
}
