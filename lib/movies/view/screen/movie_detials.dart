import 'package:flutter/material.dart';

class MovieDetials extends StatelessWidget {
  static const String routeName = '/moviedetials';
  MovieDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Movie Detials",
        style: TextStyle(color: Colors.yellow, fontSize: 30),
      ),
    );
  }
}
