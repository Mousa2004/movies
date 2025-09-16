import 'package:flutter/material.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/view/widget/customed_watch.dart';
import 'package:movies/movies/view/widget/customed_genres.dart';

class MovieDetails extends StatelessWidget {
    static const String routName = '/moviedetails';
    final MovieModel movie;

    const MovieDetails({super.key, required this.movie});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        CustomedWatch(movie: movie),
                        if (movie.genres != null && movie.genres!.isNotEmpty)
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: SizedBox(
                                width: double.infinity,
                                child: CustomedGenres(genres: movie.genres!)
                            )
                        )
                    ]
                )
            )
        );
    }
}
