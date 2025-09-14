import 'package:flutter/material.dart';
import 'package:movies/movies/view/widget/customed_watch.dart';

class MovieDetials extends StatelessWidget {
  static const String routeName = '/moviedetials';
  MovieDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(children: [CustomedWatch()])),
    );
  }
}
