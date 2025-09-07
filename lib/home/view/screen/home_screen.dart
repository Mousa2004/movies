import 'package:flutter/material.dart';
import 'package:movies/home/view/screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    _BrowseTab(),
    SearchScreen(),
    _GalleryTab(),
    _ProfileTab(),
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
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.photo_library_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: ''),
        ],
      ),
    );
  }
}

class _BrowseTab extends StatelessWidget {
  const _BrowseTab();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('Browse', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}

class _GalleryTab extends StatelessWidget {
  const _GalleryTab();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('Gallery', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('Profile', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
