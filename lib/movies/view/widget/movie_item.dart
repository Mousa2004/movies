import 'package:flutter/material.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import '../screen/movie_detials.dart';

class MovieItem extends StatelessWidget {
    final MovieModel movie;

    const MovieItem({super.key, required this.movie});

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: () {
                Navigator.pushNamed(
                    context,
                    MovieDetails.routName,
                    arguments: movie
                );
            },
            child: Column(
                children: [
                    Image.network(movie.largeCoverImage!, fit: BoxFit.cover, height: 150),
                    const SizedBox(height: 6),
                    Text(
                        movie.title!,
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                        overflow: TextOverflow.ellipsis
                    ),
                    Text(
                        "⭐ ${movie.rating}",
                        style: const TextStyle(color: Colors.amber, fontSize: 12)
                    )
                ]
            )
        );
    }
}
