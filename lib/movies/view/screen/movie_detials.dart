import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/bloc/movie_details_cubit.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/view/widget/LoadingIndicator.dart';
import 'package:movies/movies/view/widget/custom_details_actors.dart';
import 'package:movies/movies/view/widget/customed_watch.dart';
import 'package:movies/movies/view/widget/summary.dart';
import 'package:movies/movies/view/widget/customed_genres.dart';

import '../../../auth/view/screen/SimilarMoviesSection.dart';


class MovieDetials extends StatelessWidget {
  static const String routeName = '/moviedetails';


  @override
  Widget build(BuildContext context) {
    TextTheme textTitle = Theme.of(context).textTheme;
    final movie = ModalRoute.of(context)!.settings.arguments as MovieModel;

    return BlocProvider(
      create: (_) => MovieDetailsCubit()..fetchMovieDetails(movie.id!),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return Center(child: LoadingIndicator());
            } else if (state is MovieDetailsLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomedWatch(movie: movie,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text("Screen Shots", style: textTitle.headlineSmall),
                          SizedBox(height: 8),

                          SizedBox(height: 8),

                          SimilarMoviesSection(movieId: movie.id!),

                          SizedBox(height: 8),

                          SizedBox(height: 8),
                          Text("Summary", style: textTitle.headlineSmall),
                          SizedBox(height: 8),
                          Summary(movie: state.movie,),
                          SizedBox(height: 8),
                          Text("Cast", style: textTitle.headlineSmall),
                          SizedBox(height: 8),
                          CustomDetailsActors(movie: state.movie),
                          SizedBox(height: 8),
                          Text("Genres", style: textTitle.headlineSmall),
                          SizedBox(height: 8),
                         if (movie.genres != null && movie.genres!.isNotEmpty)
                         Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: SizedBox(
                                width: double.infinity,
                                child: CustomedGenres(genres: movie.genres!)
                            )
                        )
                        ],
                      ),
                    ),

                  ],
                ),
              );
            } else if (state is MovieDetailsError) {
              return Center(child: Text(state.message));
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

}
