import 'package:flutter/material.dart';
import 'package:movies/auth/view/screen/register_screen.dart';
import 'package:movies/home/view/screen/home_screen.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

import 'home/view/screen/update_profile_screen.dart';

void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: UpdateProfileScreen.routeName,
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        RegisterScreen.routName: (_) => RegisterScreen(),
        UpdateProfileScreen.routeName: (_) => UpdateProfileScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
