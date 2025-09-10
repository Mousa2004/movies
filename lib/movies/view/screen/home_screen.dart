//
//
// import 'package:flutter/material.dart';
// import 'package:movies/movies/view/screen/home_tab.dart';
//
// import 'screen/search_screen.dart';
// class HomeScreen extends StatefulWidget {
//   static const String routName = '/home';
//
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;
//
//   final List<Widget> _tabs = [
//     HomeTab(),
//     SearchScreen(),
//     const _BrowseTab(),
//     _ProfileTab(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _tabs[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (i) => setState(() => _currentIndex = i),
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         selectedItemColor: Colors.amber,
//         unselectedItemColor: Colors.grey.shade400,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: const [
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage("assets/images/home_icon.png")),
//             activeIcon: ImageIcon(
//               AssetImage("assets/images/home_selected_icon.png"),
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage("assets/images/search_icon.png")),
//             activeIcon: ImageIcon(
//               AssetImage("assets/images/search_selected_icon.png"),
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage("assets/images/explore_icon.png")),
//             activeIcon: ImageIcon(
//               AssetImage("assets/images/explore_selected_icon.png"),
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage("assets/images/profile_icon.png")),
//             activeIcon: ImageIcon(
//               AssetImage("assets/images/profile_selected_icon.png"),
//             ),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _BrowseTab extends StatelessWidget {
//   const _BrowseTab();
//
//   @override
//   Widget build(BuildContext context) {
//     return const SafeArea(child: MovieGridWithCategories());
//   }
// }
//
// class MovieGridWithCategories extends StatefulWidget {
//   const MovieGridWithCategories({super.key});
//
//   @override
//   _MovieGridWithCategoriesState createState() =>
//       _MovieGridWithCategoriesState();
// }
//
// class _MovieGridWithCategoriesState extends State<MovieGridWithCategories> {
//   final List<String> categories = [
//     'All',
//     'Action',
//     'Comedy',
//     'Drama',
//     'Horror',
//     'Sci-Fi'
//   ];
//   }
// home_screen.dart
import 'package:flutter/material.dart';
import 'package:movies/movies/view/screen/home_tab.dart';
import 'package:movies/movies/view/screen/search_screen.dart';

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
    _BrowseTab(),
    const _ProfileTab(),
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
            activeIcon: ImageIcon(AssetImage("assets/images/home_selected_icon.png")),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/search_icon.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/search_selected_icon.png")),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/explore_icon.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/explore_selected_icon.png")),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/profile_icon.png")),
            activeIcon: ImageIcon(AssetImage("assets/images/profile_selected_icon.png")),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _GalleryTab extends StatelessWidget {
  const _GalleryTab();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Center(child: Text('Gallery', style: TextStyle(fontSize: 22))));
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Center(child: Text('Profile', style: TextStyle(fontSize: 22))));
  }
}

class _BrowseTab extends StatelessWidget {
  const _BrowseTab();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: MovieGridWithCategories());
  }
}

class MovieGridWithCategories extends StatefulWidget {
  const MovieGridWithCategories({super.key});

  @override
  _MovieGridWithCategoriesState createState() =>
      _MovieGridWithCategoriesState();
}
class _MovieGridWithCategoriesState extends State<MovieGridWithCategories> {
  final List<String> categories = [
    'All',
    'Action',
    'Adventure',
    'Animation',
    'Comedy',
    'Crime',
    'Drama',
    'Fantasy',
    'Horror',
    'Romance',
    'Sci-Fi',
    'Thriller',
  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // شريط التصنيفات
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = selectedCategory == category;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.red : Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        // GridView للأفلام
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عمودين
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: 10, // مؤقت - عدد الأفلام
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://via.placeholder.com/150"), // صورة مؤقتة
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black54,
                    child: Text(
                      "$selectedCategory Movie $index",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


