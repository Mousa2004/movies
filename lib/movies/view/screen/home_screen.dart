import 'package:flutter/material.dart';
import 'package:movies/movies/view/home_tab.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeTab(),
    );
  }
}
