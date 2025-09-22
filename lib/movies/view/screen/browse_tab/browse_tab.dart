import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/bloc/browse_state.dart';
import 'package:movies/movies/view/widget/LoadingIndicator.dart';
import 'package:movies/movies/view/widget/movie_card.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import '../../../bloc/browse_cubit.dart';
import 'tab_item.dart';

class BrowseTab extends StatelessWidget {
  BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BrowseCubit()..fetchMovies(),
      child: BlocBuilder<BrowseCubit, BrowseState>(
        builder: (context, state) {
          if (state is BrowseLoading) {
            return LoadingIndicator();
          } else if (state is BrowseError) {
            return Center(child: Text(state.message));
          } else if (state is BrowseLoaded) {
            final genreList = state.genres.toList();

            return DefaultTabController(
              length: genreList.length,
              child: Builder(
                builder: (context) {
                  final TabController controller = DefaultTabController.of(
                    context,
                  );
                  return SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: TabBar(
                            controller: controller,
                            isScrollable: true,
                            dividerColor: Colors.transparent,
                            indicatorColor: Colors.transparent,
                            tabAlignment: TabAlignment.start,
                            labelPadding: EdgeInsets.only(right: 10),
                            tabs: genreList.map((genre) {
                              final index = genreList.indexOf(genre);
                              return Tab(
                                child: AnimatedBuilder(
                                  animation: controller,
                                  builder: (context, _) {
                                    return TabItem(
                                      label: genre,
                                      isSelected: controller.index == index,
                                      selectedForegroundColor: Colors.black,
                                      unselectedForegroundColor: Colors.white,
                                      selectedBackgroundColor: AppTheme.yellow,
                                    );
                                  },
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
                                  .where(
                                    (movie) =>
                                        movie.genres != null &&
                                        movie.genres!.contains(genre),
                                  )
                                  .toList();

                              if (filteredMovies.isEmpty) {
                                return Center(
                                  child: Text("No movies in $genre"),
                                );
                              }

                              return GridView.builder(
                                padding: EdgeInsets.only(left: 30),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.8,
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
