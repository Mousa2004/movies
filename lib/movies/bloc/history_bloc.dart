import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/bloc/history_state.dart';
import 'package:movies/movies/data/repositories/history_repository.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/shared/view/widget/Service_locator.dart';

final historyRepository = HistoryRepository(ServiceLocator.historyDataSources);

class HistoryBloc extends Cubit<HistoryState> {
  HistoryBloc() : super(InitialHistory());

  void addMovieToHistoryList(MovieModel movie) async {
    emit(HistoryLoading());
    try {
      final updatedList = historyRepository.addMovieToHistory(movie);
      emit(HistorySuccess(await updatedList));
    } catch (e) {
      emit(HistoryError(message: "Failed to load history list"));
    }
  }

  void getMovieFromHistoryList() async {
    emit(HistorySuccess(await historyRepository.getMovieFromHistory()));
  }

  Future<int> getHistoryListCount() async {
    final movies = await historyRepository.getMovieFromHistory();
    return movies.length;
  }
}
