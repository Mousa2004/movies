import 'package:flutter/material.dart';
import 'package:movies/movies/data/data_sources/api/watch_movie_data_sources.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/view/widget/customed_evaluation.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';

class CustomedWatch extends StatelessWidget {
    final MovieModel movie; 
    final void Function()? addWatchList;

    const CustomedWatch({
        super.key,
        required this.movie,
        this.addWatchList
    });

    @override
    Widget build(BuildContext context) {
        WatchMovieDataSources watchMovieDataSources = WatchMovieDataSources();

        return SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Stack(
                children: [
                    Positioned.fill(
                        child: Image.network(movie.largeCoverImage ?? "",
                            fit: BoxFit.fill, errorBuilder: (_, __, ___) {
                                return Container(color: Colors.grey);
                            })
                    ),
                    Positioned.fill(
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                        AppTheme.black.withValues(alpha: 0.1),
                                        AppTheme.black.withValues(alpha: 0.9)
                                    ]
                                )
                            )
                        )
                    ),
                    SafeArea(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                                children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            InkWell(
                                                onTap: () {
                                                    Navigator.of(context).pop();
                                                },
                                                child: const Icon(
                                                    Icons.arrow_back_ios,
                                                    color: Colors.white,
                                                    size: 29
                                                )
                                            ),
                                            InkWell(
                                                onTap: addWatchList,
                                                child: Image.asset(
                                                    "assets/images/watch_list.png",
                                                    height: 20,
                                                    width: 29,
                                                    fit: BoxFit.scaleDown
                                                )
                                            )
                                        ]
                                    ),
                                    const Spacer(),
                                    Image.asset("assets/images/watch.png", height: 97, width: 97),
                                    const Spacer(),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                            movie.title ?? "No Title",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(color: Colors.white)
                                        )
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                        "${movie.year ?? 'Unknown'}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(color: Colors.white)
                                    ),
                                    const SizedBox(height: 8),
                                    CustomedButton(
                                        text: "Watch",
                                        colorButton: AppTheme.red,
                                        colorText: AppTheme.white,
                                        onPressed: () async {
                                            await watchMovieDataSources.watchMovie(movie);
                                        }
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                        children: [
                                            const Expanded(
                                                child: CustomedEvaluation(
                                                    imageName: "love",
                                                    textNumber: "18"
                                                )
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                                child: CustomedEvaluation(
                                                    imageName: "time",
                                                    textNumber: "" 
                                                )
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                                child: CustomedEvaluation(
                                                    imageName: "interaction",
                                                    textNumber: "" 
                                                )
                                            )
                                        ]
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                            Text("Runtime: ${movie.runtime ?? 'N/A'}",
                                                style: const TextStyle(color: Colors.white)),
                                            Text("Rating: ${movie.rating ?? 'N/A'}",
                                                style: const TextStyle(color: Colors.white))
                                        ]
                                    )
                                ]
                            )
                        )
                    )
                ]
            )
        );
    }
}
