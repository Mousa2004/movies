class MovieModel {
  final int id;
  final String title;
  final String image;
  final double rating;
  final List<String> genres;
  final String descriptionFull;
  final String largeCoverImage;

  MovieModel({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.genres,
    required this.descriptionFull,
    required this.largeCoverImage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      image: json['medium_cover_image'],
      rating: (json['rating'] as num).toDouble(),
      genres: List<String>.from(json['genres'] ?? []),
      descriptionFull: json['description_full'] ?? '',
      largeCoverImage: json['large_cover_image'] ?? json['medium_cover_image'],
    );
  }
}
