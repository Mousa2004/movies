import 'package:movies/movies/data/models/movie_model.dart';

abstract class HistoryState {}

class InitialHistory extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistorySuccess extends HistoryState {
  final List<MovieModel> history;
  int get count => history.length;
  HistorySuccess(this.history);
}

class HistoryError extends HistoryState {
  final String message;

  HistoryError({required this.message});
}
