import 'package:flutter/material.dart';
import 'package:movies/home/view/screen/home_screen.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      routes: {HomeScreen.routName: (_) => HomeScreen()},
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
