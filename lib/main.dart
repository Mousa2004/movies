import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/auth/cubit/auth_bloc.dart';
import 'package:movies/auth/data/data_sources/local/auth_sharedprefrences_data_sources.dart';
import 'package:movies/auth/view/screen/login_screen.dart';
import 'package:movies/auth/view/screen/register_screen.dart';
import 'package:movies/movies/bloc/get_profile_bloc.dart';
import 'package:movies/movies/bloc/history_bloc.dart';
import 'package:movies/movies/bloc/movies_bloc.dart';
import 'package:movies/movies/bloc/watch_list_bloc.dart';
import 'package:movies/movies/view/screen/home_screen.dart';
import 'package:movies/movies/view/screen/movie_detials.dart';
import 'package:movies/movies/view/screen/profile_tab.dart';
import 'package:movies/onboarding/on_boarding.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/my_bloc_observer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  final prefs = await SharedPreferences.getInstance();
  final bool showOnBoarding = prefs.getBool("onboarding") ?? true;

  final authLocalDataSources = AuthSharedprefrencesDataSources();
  final String? token = await authLocalDataSources.getToken();

  runApp(MoviesApp(showOnBoarding: showOnBoarding, token: token));
}

class MoviesApp extends StatelessWidget {
  final bool showOnBoarding;
  final String? token;

  const MoviesApp({
    super.key,
    required this.showOnBoarding,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MoviesBloc()..loadMovies()),
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (context) => WatchListBloc()..getWatchList()),
        BlocProvider(
          create: (context) => HistoryBloc()..getMovieFromHistoryList(),
        ),
        BlocProvider(create: (context) => GetProfileBloc()..getProfile()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: showOnBoarding
            ? OnBoarding.routeName
            : (token != null ? HomeScreen.routName : LoginScreen.routName),
        routes: {
          HomeScreen.routName: (_) => const HomeScreen(),
          OnBoarding.routeName: (_) => OnBoarding(),
          LoginScreen.routName: (_) => LoginScreen(),
          RegisterScreen.routName: (_) => RegisterScreen(),
          ProfileTab.routName: (_) => ProfileTab(),
          MovieDetials.routeName: (_) => MovieDetials(),
        },
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
