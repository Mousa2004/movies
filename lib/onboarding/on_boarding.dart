import 'package:flutter/material.dart';
import 'package:movies/onboarding/on_boarding_model.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/home/view/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({super.key});

  static const routeName = "/onBoarding";

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // int currentIndex = 0;
  PageController pageController = PageController();

  List<OnBoardingModel> onBoardingPage = [];

  @override
  void initState() {
    super.initState();
    onBoardingPage = [
      OnBoardingModel(
        title: "Find Your Next Favorite Movie Here",
        imageName: "assets/images/Movies_Posters.png",
        description:
            "Get access to a huge library of movies to suit all tastes. You will surely like it.",
        textButton: "Explore Now",
        backgroundColor: AppTheme.transparent,
        next: () => nextPage(0),
        back: () => backPage(0),
      ),
      OnBoardingModel(
        title: "Discover Movies",
        imageName: "assets/images/onBoarding2.png",
        description:
            "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
        textButton: "Next",
        next: () => nextPage(1),
        back: () => backPage(1),
      ),
      OnBoardingModel(
        title: "Explore All Genres",
        imageName: "assets/images/onBoarding4.png",
        description:
            "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
        textButton: "Next",
        isContainSecondButton: true,
        next: () => nextPage(2),
        back: () => backPage(2),
      ),
      OnBoardingModel(
        title: "Create Watchlists",
        imageName: "assets/images/onBoarding4.png",
        description:
            "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
        textButton: "Next",
        isContainSecondButton: true,
        next: () => nextPage(3),
        back: () => backPage(3),
      ),
      OnBoardingModel(
        title: "Rate, Review, and Learn",
        imageName: "assets/images/onBoarding5.png",
        description:
            "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
        textButton: "Next",
        isContainSecondButton: true,
        next: () => nextPage(4),
        back: () => backPage(4),
      ),
      OnBoardingModel(
        title: "Start Watching Now",
        imageName: "assets/images/onBoarding6.png",
        description: "",
        textButton: "Finish",
        isContainSecondButton: true,
        next: () => nextPage(5),
        back: () => backPage(5),
      ),
    ];
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: PageView.builder(
        controller: pageController,
        itemCount: onBoardingPage.length,
        itemBuilder: (context, index) {
          return onBoardingPage[index];
        },
      ),
    );
  }

  void nextPage(int index) async {
    if (index < onBoardingPage.length - 1) {
      pageController.animateToPage(
        index + 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    } else {
      await saveOnBoarding();

      ///هنا انا بدي معلومه انه استسخدم الاون بوردينج
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
    }
  }

  void backPage(int index) {
    if (index < onBoardingPage.length) {
      pageController.animateToPage(
        index - 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  Future saveOnBoarding() async {
    ///حفظ ان انا استخدمت الاون بوردينج
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(
      "onboarding",
      false,
    ); //دي معناها ان انا خزنت قيمه لا بالمفتاح اون بوردينج
  }
}
