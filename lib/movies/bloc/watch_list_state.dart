import 'package:movies/movies/data/models/movie_model.dart';

abstract class WatchListState {}

class InitialWatchList extends WatchListState {}

class WatchListLoading extends WatchListState {}

class WatchListSuccess extends WatchListState {
  final List<MovieModel> watchList;
  int get count => watchList.length;
  WatchListSuccess(this.watchList);
}

class WatchListError extends WatchListState {
  final String message;

  WatchListError({required this.message});
}
