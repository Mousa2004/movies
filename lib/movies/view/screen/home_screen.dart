import 'package:flutter/material.dart';
import 'package:movies/movies/view/screen/browse_tab.dart';
import 'package:movies/movies/view/screen/home_tab.dart';
import 'package:movies/movies/view/screen/profile_tab.dart' show ProfileTab;
import 'package:movies/movies/view/screen/search_screen.dart';
// ✅ استيراد MovieItem (عشان يبقى متاح جوه HomeTab وغيره)

class HomeScreen extends StatefulWidget {
  static const String routName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> get _tabs => [
    HomeTab(),
    SearchScreen(),
    BrowseTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey.shade400,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/home_icon.png")),
            activeIcon: ImageIcon(
              AssetImage("assets/images/home_selected_icon.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/search_icon.png")),
            activeIcon: ImageIcon(
              AssetImage("assets/images/search_selected_icon.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/explore_icon.png")),
            activeIcon: ImageIcon(
              AssetImage("assets/images/explore_selected_icon.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/profile_icon.png")),
            activeIcon: ImageIcon(
              AssetImage("assets/images/profile_selected_icon.png"),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
