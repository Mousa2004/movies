import 'package:flutter/material.dart';
import 'package:movies/movies/data/models/movie_model.dart' show MovieModel;
import 'package:movies/shared/view/widget/app_theme.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTitle = Theme.of(context).textTheme;
    final movie = ModalRoute.of(context)!.settings.arguments as MovieModel;
    return Text(
      "${movie.descriptionFull}",
      style: textTitle.titleMedium!.copyWith(color: AppTheme.white),
    );
  }
}