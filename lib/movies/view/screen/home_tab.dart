import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/data/bloc/movies_state.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import '../../data/bloc/movies_bloc.dart';
import '../widget/LoadingIndicator.dart';
import '../widget/movie_card.dart';


class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextTheme textTitle = Theme.of(context).textTheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/onBoarding6.png",
          height: height,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        SingleChildScrollView(
          child: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state is MoviesLoading) {
                return LoadingIndicator();
              } else if (state is MoviesLoaded) {
                return Column(
                  children: [
                    SizedBox(height: 14),
                    Image.asset(
                      "assets/images/AvailableNow.png",
                      height: height * 0.1,
                      width: width * 0.8,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: height * 0.38,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.5),
                        itemCount: state.latestMovies.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: MovieCard(movie: state.latestMovies[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    Image.asset(
                      "assets/images/WatchNow.png",
                      height: height * 0.1,
                      width: width * 0.8,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            state.currentCategory,
                            style: textTitle.titleLarge!.copyWith(
                              color: AppTheme.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "See More",
                            style: textTitle.titleLarge!.copyWith(
                              color: AppTheme.yellow,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(Icons.arrow_forward,
                              color: AppTheme.yellow, size: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: height * 0.38,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.5),
                        itemCount: state.categoryMovies.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: MovieCard(movie: state.categoryMovies[index]),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is MoviesError) {
                return Center(child: Text(state.message));
              } else {
                return Center(child: Text("Something went wrong"));
              }
            },
          ),
        ),
      ],
    );
  }
}
