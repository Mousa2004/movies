import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "search";

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Search for a movie...",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.white),
            border: InputBorder.none,
          ),
        ),
      ),
      body: Center(
        child: Image.asset(
          "assets/images/popcorn.png",
          height: 140,
        ),
      ),
    );
  }
}
