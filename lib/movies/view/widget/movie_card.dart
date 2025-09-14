import 'package:flutter/material.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/view/screen/movie_detials.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    TextTheme textTitle = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetials.routeName, arguments: movie);
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        height: height * 0.38,
        width: width * 0.5,
        child: Stack(
          children: [
            Image.network(movie.largeCoverImage!, fit: BoxFit.fill),

            ///change image by api
            Container(
              margin: EdgeInsets.only(left: 8, top: 8),
              width: width * 0.2,
              height: height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppTheme.grey.withOpacity(0.7),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movie.rating.toString(),
                    style: textTitle.titleMedium!.copyWith(
                      color: AppTheme.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Image.asset(
                    "assets/images/star.png",
                    fit: BoxFit.fill,
                    height: height * 0.02,
                    width: width * 0.04,
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
