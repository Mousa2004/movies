import 'dart:convert';
import 'package:movies/movies/data/data_sources/api/watch_list_data_sources.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/shared/const/api_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchListRepository {
  final WatchListDataSources watchListDataSources;
  WatchListRepository(this.watchListDataSources);

  Future<List<MovieModel>> addMovieToWatchList(MovieModel movie) async {
    final watchList = watchListDataSources.addMovieToWatchList(movie);

    final sharedPref = await SharedPreferences.getInstance();

    await sharedPref.setStringList(
      CacheConstant.watchListKey,
      watchList.map((m) => jsonEncode(m.toJson())).toList(),
    );

    return watchList;
  }

  Future<List<MovieModel>> getWatchList() async {
    final sharedPref = await SharedPreferences.getInstance();
    final watchList = sharedPref.getStringList(CacheConstant.watchListKey);

    if (watchList == null) {
      return [];
    }

    return watchList
        .map((movie) => MovieModel.fromJson(jsonDecode(movie)))
        .toList();
  }
}
