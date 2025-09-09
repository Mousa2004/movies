import 'package:flutter/material.dart';
import 'package:movies/home/view/screen/search_screen.dart';
class HomeScreen extends StatefulWidget {
  static String routName = '/home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
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

class _BrowseTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        
        body: SafeArea(child: MovieGridWithCategories()),
      ),
    );
  }
}

class MovieGridWithCategories extends StatefulWidget {
  @override
  _MovieGridWithCategoriesState createState() =>
      _MovieGridWithCategoriesState();
}

class _MovieGridWithCategoriesState extends State<MovieGridWithCategories> {
  final List<String> categories = [
    'All',
    'Action',
    'Adventure',
    'Drama',
    'Comedy',
    'Sci-Fi',
    'Horror',
  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Scrollable categories
        Container(
          height: 50,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final label = categories[index];
              final isSelected = label == selectedCategory;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = label;
                  });
                },
                child: CategoryChip(label: label, isSelected: isSelected),
              );
            },
          ),
        ),

        // Grid of movies
        Expanded(child: MovieGrid()),
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        backgroundColor: isSelected ? Colors.yellow[700] : Colors.grey[800],
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }
}

class MovieGrid extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {
      'title': 'avengars',
      'image': 'assets/images/avengars.jpg',
      'rating': '7.7',
    },
    {
      'title': 'Black Widow',
      'image': 'assets/images/Black wido.png',
      'rating': '7.7',
    },
    {'title': 'Joker', 'image': 'assets/images/jokar.png', 'rating': '7.7'},
    {'title': 'Iron Man 3', 'image': 'assets/images/iron man.png', 'rating': '7.7'},
    {
      'title': 'Captain America: Civil War',
      'image': 'assets/images/captain.png',
      'rating': '7.7',
    },   {
      'title': 'doctor stareng: doctor stareng',
      'image': 'assets/images/doctor stareng.jpg',
      'rating': '7.7',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: movies.length,
      itemBuilder: (ctx, index) {
        return MovieCard(
          title: movies[index]['title']!,
          imagePath: movies[index]['image']!,
          rating: movies[index]['rating']!,
        );
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String rating;

  MovieCard({
    required this.title,
    required this.imagePath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(imagePath, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    SizedBox(width: 4),
                    Text(
                      rating,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
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
    return const SafeArea(
      child: Center(child: Text('Gallery', style: TextStyle(fontSize: 22))),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile header
            Row(
              children: [
                const SizedBox(width: 16),
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(
                    "assets/images/avatar3.png",
                  ), // صورة افتراضية
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "John Safwat",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "12 ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Wish List"),
                        SizedBox(width: 20),
                        Text(
                          "10 ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("History"),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Text("Edit Profile"),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text("Exit"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tabs
            TabBar(
              controller: _tabController,
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.yellow,
              tabs: const [
                Tab(icon: Icon(Icons.list), text: "Watch List"),
                Tab(icon: Icon(Icons.folder), text: "History"),
              ],
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Watch List
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.local_movies,
                          size: 80,
                          color: Colors.yellow,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "No movies in Watch List",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),

                  // History Grid
                  GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/images/avengars.jpg",
                              // صورة موفي افتراضية
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            left: 4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                "7.7⭐",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
