import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/view/widget/movie_item.dart';

import '../../bloc/search/search_bloc.dart';
import '../../bloc/search/search_event.dart';
import '../../bloc/search/search_state.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "/search";

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Search Movies"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // 🔎 Search Input
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search for a movie...",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onSubmitted: (query) {
                      if (query.isNotEmpty) {
                        context.read<SearchBloc>().add(SearchMoviesEvent(query));
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // 🎬 Results
                  Expanded(
                    child: BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                        if (state is SearchInitial) {
                          return const Center(
                            child: Text("Type a movie name to start searching"),
                          );
                        } else if (state is SearchLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SearchLoaded) {
                          if (state.movies.isEmpty) {
                            return const Center(
                              child: Text(
                                "No movies found",
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          }
                          return GridView.builder(
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.65,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: state.movies.length,
                            itemBuilder: (context, index) {
                              final movie = state.movies[index];
                              return MovieItem(movie: movie);
                            },
                          );
                        } else if (state is SearchError) {
                          return Center(
                            child: Text(state.message),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
