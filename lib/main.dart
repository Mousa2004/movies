import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/auth/cubit/auth_bloc.dart';
import 'package:movies/auth/data/data_sources/local/auth_local_data_sources.dart';
import 'package:movies/auth/data/data_sources/local/auth_sharedprefrences_data_sources.dart';
import 'package:movies/auth/view/screen/login_screen.dart';
import 'package:movies/auth/view/screen/register_screen.dart';
import 'package:movies/movies/bloc/movies_bloc.dart';
import 'package:movies/movies/view/screen/home_screen.dart';
import 'package:movies/movies/view/screen/update_profile_screen.dart';
import 'package:movies/onboarding/on_boarding.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final bool showOnBoarding = prefs.getBool("onboarding") ?? true;

  runApp(MoviesApp(showOnBoarding: showOnBoarding));
}

class MoviesApp extends StatelessWidget {
  final bool showOnBoarding;

  const MoviesApp({super.key, required this.showOnBoarding});

  @override
  Widget build(BuildContext context) {
    AuthLocalDataSources checkLogin = AuthSharedprefrencesDataSources();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MoviesBloc()..loadMovies()),
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: showOnBoarding
            ? OnBoarding.routeName
            : (checkLogin.getToken() != null
                  ? HomeScreen.routName
                  : LoginScreen.routName),

        routes: {
          HomeScreen.routName: (_) => const HomeScreen(),
          OnBoarding.routeName: (_) => OnBoarding(),
          LoginScreen.routName: (_) => LoginScreen(),
          RegisterScreen.routName: (_) => RegisterScreen(),
          UpdateProfileScreen.routName: (_) => UpdateProfileScreen(),
        },
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
