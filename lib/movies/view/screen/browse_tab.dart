import 'package:flutter/material.dart';

class BrowseTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,

        body: SafeArea(child: MovieGridWithCategories()),
      ),
    );
  }
}

class MovieGridWithCategories extends StatefulWidget {
  @override
  _MovieGridWithCategoriesState createState() =>
      _MovieGridWithCategoriesState();
}

class _MovieGridWithCategoriesState extends State<MovieGridWithCategories> {
  final List<String> categories = [
    'All',
    'Action',
    'Adventure',
    'Drama',
    'Comedy',
    'Sci-Fi',
    'Horror',
  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Scrollable categories
        Container(
          height: 50,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final label = categories[index];
              final isSelected = label == selectedCategory;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = label;
                  });
                },
                child: CategoryChip(label: label, isSelected: isSelected),
              );
            },
          ),
        ),

        // Grid of movies
        Expanded(child: MovieGrid()),
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        backgroundColor: isSelected ? Colors.yellow[700] : Colors.grey[800],
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }
}

class MovieGrid extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      'title': 'avengars',
      'image': 'assets/images/avengars.jpg',
      'rating': '7.7',
    },
    {
      'title': 'Black Widow',
      'image': 'assets/images/Black wido.png',
      'rating': '7.7',
    },
    {'title': 'Joker', 'image': 'assets/images/jokar.png', 'rating': '7.7'},
    {'title': 'Iron Man 3', 'image': 'assets/images/iron man.png', 'rating': '7.7'},
    {
      'title': 'Captain America: Civil War',
      'image': 'assets/images/captain.png',
      'rating': '7.7',
    },   {
      'title': 'doctor stareng: doctor stareng',
      'image': 'assets/images/doctor stareng.jpg',
      'rating': '7.7',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: movies.length,
      itemBuilder: (ctx, index) {
        return MovieCard(
          title: movies[index]['title']!,
          imagePath: movies[index]['image']!,
          rating: movies[index]['rating']!,
        );
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String rating;

  MovieCard({
    required this.title,
    required this.imagePath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(imagePath, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    SizedBox(width: 4),
                    Text(
                      rating,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}