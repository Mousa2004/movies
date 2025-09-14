import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/shared/view/widget/dialog_message.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WatchMovieDataSources {
  Future<void> watchMovie(MovieModel movie) async {
    try {
      String? finalUrl;
      if (movie.ytTrailerCode != null && movie.ytTrailerCode!.isNotEmpty) {
        finalUrl = "https://www.youtube.com/watch?v=${movie.ytTrailerCode}";
      } else if (movie.url != null && movie.url!.isNotEmpty) {
        finalUrl = movie.url;
      }

      if (finalUrl != null) {
        await launchUrlString(finalUrl, mode: LaunchMode.externalApplication);
      } else {
        DialogMessage.showErrorMessage("No available link for this movie");
      }
    } catch (e) {
      DialogMessage.showErrorMessage("Error launching URL: $e");
    }
  }
}
