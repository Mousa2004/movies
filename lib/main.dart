import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/auth/cubit/auth_bloc.dart';
import 'package:movies/auth/view/screen/login_screen.dart';
import 'package:movies/auth/view/screen/register_screen.dart';
import 'package:movies/home/view/screen/home_screen.dart';
import 'package:movies/onboarding/on_boarding.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/my_bloc_observer.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;
import 'home/view/screen/update_profile_screen.dart';
import 'auth/view/screen/ForgetPasswordPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  ///في المينasync لازم تتكتب عشان انت استخدمتAli
  final prefs = await SharedPreferences.getInstance();
  final bool showOnBoarding = prefs.getBool("onboarding") ?? true;

  ///Ali

  runApp(MoviesApp(showOnBoarding: showOnBoarding));
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key, required this.showOnBoarding});

  ///Ali
  final bool showOnBoarding;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: showOnBoarding
            ? OnBoarding.routeName
            : LoginScreen.routName,

        ///Ali
        routes: {
          HomeScreen.routName: (_) => HomeScreen(),
          RegisterScreen.routName: (_) => RegisterScreen(),
          OnBoarding.routeName: (_) => OnBoarding(),
          UpdateProfileScreen.routeName: (_) => UpdateProfileScreen(),
          ForgetPasswordPage.routName: (_) => ForgetPasswordPage(),
          LoginScreen.routName: (_) => LoginScreen(),
        },
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
