import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/bloc/movie_carde.dart';
import '../bloc/browse_cubit.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BrowseCubit()..fetchMovies(),
      child: BlocBuilder<BrowseCubit, BrowseState>(
        builder: (context, state) {
          if (state is BrowseLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BrowseError) {
            return Center(child: Text(state.message));
          } else if (state is BrowseLoaded) {
            final genreList = state.genres;

            return DefaultTabController(
              length: genreList.length,
              child: Builder(
                builder: (context) {
                  final controller = DefaultTabController.of(context);
                  return SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: TabBar(
                            controller: controller,
                            isScrollable: true,
                            indicatorColor: Colors.transparent,
                            labelPadding: EdgeInsets.only(right: 10),
                            tabs: genreList.map((genre) {
                              final index = genreList.indexOf(genre);
                              return Tab(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: controller.index == index
                                        ? Colors.yellow
                                        : Colors.grey[800],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    genre,
                                    style: TextStyle(
                                      color: controller.index == index
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 16),
                        Expanded(
                          child: TabBarView(
                            controller: controller,
                            children: genreList.map((genre) {
                              final filteredMovies = state.movies
                                  .where((movie) => movie.genres.contains(genre))
                                  .toList();

                              if (filteredMovies.isEmpty) {
                                return Center(
                                  child: Text("No movies in $genre"),
                                );
                              }

                              return GridView.builder(
                                padding: EdgeInsets.only(left: 30, right: 16),
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                                itemCount: filteredMovies.length,
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: MovieCard(
                                      movie: filteredMovies[index],
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
