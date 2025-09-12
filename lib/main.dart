// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/auth/cubit/auth_bloc.dart';
import 'package:movies/auth/view/screen/login_screen.dart';
import 'package:movies/movies/data/bloc/movies_bloc.dart';
import 'package:movies/movies/view/screen/home_screen.dart';
import 'package:movies/movies/view/screen/movie_detials.dart';
import 'package:movies/onboarding/on_boarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'shared/view/widget/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool showOnBoarding = prefs.getBool("onboarding") ?? true;

  runApp(MoviesApp(showOnBoarding: showOnBoarding));
}

class MoviesApp extends StatelessWidget {
  final bool showOnBoarding;
  const MoviesApp({super.key, required this.showOnBoarding});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MoviesBloc()..loadMovies(),
        ),
        BlocProvider(
          create: (_) => AuthBloc(), // << هنا AuthBloc
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: showOnBoarding ? OnBoarding.routeName : LoginScreen.routName,
        routes: {
          HomeScreen.routName: (_) => const HomeScreen(),
          OnBoarding.routeName: (_) => OnBoarding(),
          LoginScreen.routName: (_) => LoginScreen(),
          MovieDetials.routeName:(_) =>MovieDetials(),
        },
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
