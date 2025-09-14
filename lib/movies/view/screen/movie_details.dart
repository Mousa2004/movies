import 'package:flutter/material.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/view/widget/customed_watch.dart';

class MovieDetails extends StatelessWidget {
  static const String routName = '/movieDetails';
  final MovieModel movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomedWatch(),
            // Poster
            Image.network(
              movie.largeCoverImage!,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + rating
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movie.title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            movie.rating.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Genres
                  Wrap(
                    children: movie.genres!
                        .map((g) => GenreChip(genre: g))
                        .toList(),
                  ),

                  const SizedBox(height: 16),

                  // Overview
                  Text(
                    movie.descriptionFull!,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenreChip extends StatelessWidget {
  final String genre;
  const GenreChip({required this.genre, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
