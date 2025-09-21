import 'package:flutter/material.dart';
import 'package:movies/movies/data/models/movie_model.dart' show MovieModel;
import 'package:movies/shared/view/widget/app_theme.dart';

class ScreenShots extends StatelessWidget {
  final MovieModel movie;

  const ScreenShots({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Image.network(
      "${movie.mediumCoverImage}",
      height: height * 0.02,
      width: double.infinity,
    );
  }
}
