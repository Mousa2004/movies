import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/search/search_bloc.dart';
import '../../bloc/search/search_event.dart';
import '../../bloc/search/search_state.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

import '../widget/movie_card.dart';

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
                            title: const Text("Search Movies")
                        ),
                        body: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                                children: [
                                    TextField(
                                        style: const TextStyle(color: AppTheme.white), 
                                        decoration: InputDecoration(
                                            hintText: "Search for a movie...",
                                            hintStyle: const TextStyle(color: AppTheme.yellow), 
                                            prefixIcon:
                                            const Icon(Icons.search, color: AppTheme.yellow),
                                            filled: true,
                                            fillColor: AppTheme.grey, 
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(color: AppTheme.yellow)
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(color: AppTheme.grey)
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: const BorderSide(color: AppTheme.yellow)
                                            )
                                        ),
                                        onSubmitted: (query) {
                                            if (query.isNotEmpty) {
                                                context.read<SearchBloc>().add(SearchMoviesEvent(query));
                                            }
                                        }
                                    ),
                                    const SizedBox(height: 16),

                                    Expanded(
                                        child: BlocBuilder<SearchBloc, SearchState>(
                                            builder: (context, state) {
                                                if (state is SearchInitial) {
                                                    return const Center(
                                                        child: Text(
                                                            "Type a movie name to start searching",
                                                            style: TextStyle(color: AppTheme.yellow)
                                                        )
                                                    );
                                                } else if (state is SearchLoading) {
                                                    return const Center(
                                                        child: CircularProgressIndicator(
                                                            color: AppTheme.yellow
                                                        )
                                                    );
                                                } else if (state is SearchLoaded) {
                                                    if (state.movies.isEmpty) {
                                                        return const Center(
                                                            child: Text(
                                                                "No movies found",
                                                                style: TextStyle(color: AppTheme.red)
                                                            )
                                                        );
                                                    }
                                                    return GridView.builder(
                                                        gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            childAspectRatio: 0.65,
                                                            crossAxisSpacing: 8,
                                                            mainAxisSpacing: 8
                                                        ),
                                                        itemCount: state.movies.length,
                                                        itemBuilder: (context, index) {
                                                            final movie = state.movies[index];
                                                            return MovieCard(movie: movie);
                                                        }
                                                    );
                                                } else if (state is SearchError) {
                                                    return Center(
                                                        child: Text(
                                                            state.message,
                                                            style: const TextStyle(color: AppTheme.red)
                                                        )
                                                    );
                                                }
                                                return const SizedBox.shrink();
                                            }
                                        )
                                    )
                                ]
                            )
                        )
                    );
                }
            )
        );
    }
}
