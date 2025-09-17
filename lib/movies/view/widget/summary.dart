import 'package:flutter/material.dart';
import 'package:movies/movies/data/models/movie_model.dart' show MovieModel;
import 'package:movies/shared/view/widget/app_theme.dart';

class Summary extends StatelessWidget {
  final MovieModel movie;

  const Summary({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    TextTheme textTitle = Theme.of(context).textTheme;
    return Text(
        (movie.summary?.isNotEmpty == true)
            ? movie.summary!
            : (movie.descriptionFull?.isNotEmpty == true
            ? movie.descriptionFull!
            : "No summary available for this movie"),
      style: textTitle.titleMedium!.copyWith(color: AppTheme.white),
    );
  }
}
