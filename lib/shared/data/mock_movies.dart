class Movie {
  final String title;
  final String posterUrl;
  final double rating;

  const Movie({
    required this.title,
    required this.posterUrl,
    required this.rating,
  });
}

const List<Movie> kDemoMovies = [
  Movie(
    title: 'Black Widow',
    posterUrl: 'assets/images/blackwidow.jpg',
    rating: 7.7,
  ),
  Movie(
    title: 'Captain America',
    posterUrl: 'assets/images/captain.jpg',
    rating: 7.5,
  ),
  Movie(
    title: 'Iron Man 3',
    posterUrl: 'assets/images/ironman3.jpg',
    rating: 7.4,
  ),
  Movie(
    title: 'Civil War',
    posterUrl: 'assets/images/civilwar.jpg',
    rating: 7.8,
  ),
  Movie(
    title: 'Avengers',
    posterUrl: 'assets/images/avengers.jpg',
    rating: 8.0,
  ),
  Movie(
    title: 'Doctor Strange',
    posterUrl: 'assets/images/strange.jpg',
    rating: 7.6,
  ),
];
