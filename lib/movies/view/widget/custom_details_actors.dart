import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import '../../data/models/movie_model.dart';

class CustomDetailsActors extends StatelessWidget {
  final MovieModel movie;

  const CustomDetailsActors({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TextTheme textTitle = Theme.of(context).textTheme;
    final castList = movie.cast ?? [];

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: castList.length,
        itemBuilder: (context, index) {
          final actor = castList[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppTheme.grey,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(11),
              // tileColor: AppTheme.grey,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child:
                    actor.urlSmallImage != null &&
                        actor.urlSmallImage!.isNotEmpty
                    ? Image.network(
                        actor.urlSmallImage!,
                        width: width * 0.109999999999,
                        height: height * 0.109999999999,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/images/no_image.png",
                        width: width * 0.109999999999,
                        height: height * 0.109999999999,
                        fit: BoxFit.cover,
                      ),
              ),
              title: Text(
                "Name: ${actor.name ?? ""}",
                style: textTitle.headlineSmall!.copyWith(fontSize: 20),
              ),
              subtitle: Text(
                "Character: ${actor.characterName ?? ""}",
                style: textTitle.headlineSmall!.copyWith(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
