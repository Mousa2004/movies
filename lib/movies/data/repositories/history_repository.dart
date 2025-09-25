import 'dart:convert';

import 'package:movies/movies/data/data_sources/api/history_data_sources.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/shared/const/api_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryRepository {
  final HistoryDataSources historyDataSources;
  HistoryRepository(this.historyDataSources);

  Future<List<MovieModel>> addMovieToHistory(MovieModel movie) async {
    final history = historyDataSources.addMovieToHistory(movie);
    final shredPref = await SharedPreferences.getInstance();

    shredPref.setStringList(
      CacheConstant.historyKey,
      history.map((m) => jsonEncode(m.toJson())).toList(),
    );
    return history;
  }

  Future<List<MovieModel>> getMovieFromHistory() async {
    final sharedPref = await SharedPreferences.getInstance();
    final history = sharedPref.getStringList(CacheConstant.historyKey);

    if (history == null) {
      return [];
    }

    return history
        .map((movie) => MovieModel.fromJson(jsonDecode(movie)))
        .toList();
  }
}
