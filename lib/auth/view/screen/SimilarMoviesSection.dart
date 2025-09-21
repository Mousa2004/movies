import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SimilarMoviesCubit.dart';
import 'SimilarMoviesState.dart';

class SimilarMoviesSection extends StatelessWidget {
  final int movieId;

  const SimilarMoviesSection({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SimilarMoviesCubit()..fetchSimilarMovies(movieId),
      child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
        builder: (context, state) {
          if (state is SimilarMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SimilarMoviesLoaded) {
            final movies = state.movies;
            if (movies.isEmpty) {
              return const Text("No similar movies found.");
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Similar Movies",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      // ✅ معالجة اللينك عشان يشتغل مع YTS أو TMDB
                      final posterUrl = movie.mediumCoverImage != null
                          ? (movie.mediumCoverImage!.startsWith("http")
                          ? movie.mediumCoverImage! // لو جاي لينك كامل (YTS)
                          : "https://image.tmdb.org/t/p/w200${movie.mediumCoverImage}") // لو TMDB
                          : "https://via.placeholder.com/120x160"; // Placeholder

                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              posterUrl,
                              width: 120,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 120,
                            child: Text(
                              movie.title ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is SimilarMoviesError) {
            return Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
