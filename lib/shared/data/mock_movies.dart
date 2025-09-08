class Movie {
  final String title;
  final String description;
  final String image;
  final double rating;

  const Movie({
    required this.title,
    required this.description,
    required this.image,
    required this.rating,
  });
}

const List<Movie> kDemoMovies = [
  Movie(
    title: 'Black Widow',
    description: 'An action spy movie.',
    image: 'assets/images/blackwidow.png',
    rating: 7.7,
  ),
  Movie(
    title: 'Captain America',
    description: 'Superhero action and drama.',
    image: 'assets/images/captain.png',
    rating: 7.6,
  ),
  Movie(
    title: 'Iron Man 3',
    description: 'Tony Stark faces a new threat.',
    image: 'assets/images/ironman3.png',
    rating: 7.2,
  ),
  Movie(
    title: 'Civil War',
    description: 'Heroes divided in an epic conflict.',
    image: 'assets/images/civilwar.png',
    rating: 7.8,
  ),
  Movie(
    title: 'Avengers',
    description: 'The team unites to save the world.',
    image: 'assets/images/avengers.png',
    rating: 8.0,
  ),
  Movie(
    title: 'Doctor Strange',
    description: 'Mystic arts and alternate dimensions.',
    image: 'assets/images/strange.png',
    rating: 7.5,
  ),
];
