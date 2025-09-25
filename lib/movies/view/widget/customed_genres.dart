import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

class CustomedGenres extends StatelessWidget {
  final List<String> genres;

  const CustomedGenres({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Genres",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: AppTheme.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: genres
                .map(
                  (genre) => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.black, //
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  genre,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppTheme.white,
                    fontSize: 14,
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}
