import 'package:flutter/material.dart';
import 'package:movies/shared/data/mock_movies.dart';
import 'package:movies/shared/view/widget/movie_card.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movies")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kDemoMovies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final movie = kDemoMovies[index];
          return MovieCard(movie: movie);
        },
      ),
    );
  }
}
