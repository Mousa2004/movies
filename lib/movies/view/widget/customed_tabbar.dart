import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/bloc/history_bloc.dart';
import 'package:movies/movies/bloc/history_state.dart';
import 'package:movies/movies/bloc/watch_list_state.dart';
import 'package:movies/movies/bloc/watch_list_bloc.dart';
import 'package:movies/movies/view/widget/LoadingIndicator.dart';
import 'package:movies/movies/view/widget/movie_card.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

class CustomedTabbar extends StatelessWidget {
  const CustomedTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: AppTheme.yellow,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: AppTheme.transparent,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.menu_sharp,
                    color: AppTheme.yellow,
                    size: 30,
                  ),
                  child: Text(
                    "Watch List",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: AppTheme.white),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.folder, color: AppTheme.yellow, size: 30),
                  child: Text(
                    "History",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: AppTheme.white),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                color: AppTheme.black,
                child: TabBarView(
                  children: [
                    BlocBuilder<WatchListBloc, WatchListState>(
                      builder: (context, state) {
                        if (state is WatchListLoading) {
                          return LoadingIndicator();
                        } else if (state is WatchListSuccess) {
                          if (state.watchList.isEmpty) {
                            return Center(
                              child: Text(
                                "Movie list is empty",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                            );
                          }
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: 0.7,
                                ),
                            itemCount: state.watchList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: MovieCard(movie: state.watchList[index]),
                              );
                            },
                          );
                        } else if (state is WatchListError) {
                          return Center(
                            child: Text(
                              state.message,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          );
                        }
                        return Center(
                          child: Image.asset("assets/images/popcorn.png"),
                        );
                      },
                    ),
                    BlocBuilder<HistoryBloc, HistoryState>(
                      builder: (context, state) {
                        if (state is HistoryLoading) {
                          return LoadingIndicator();
                        } else if (state is HistorySuccess) {
                          if (state.history.isEmpty) {
                            return Center(
                              child: Text(
                                "Movie list is empty",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                            );
                          }
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: 0.7,
                                ),
                            itemCount: state.history.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: MovieCard(movie: state.history[index]),
                              );
                            },
                          );
                        } else if (state is HistoryError) {
                          return Center(
                            child: Text(
                              state.message,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          );
                        }
                        return Center(
                          child: Image.asset("assets/images/popcorn.png"),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
