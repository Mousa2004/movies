import 'package:flutter/material.dart';
import 'package:movies/movies/data/data_sources/api/api_service.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/view/widget/movie_card.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<MovieModel> _results = [];
  bool _isLoading = false;
  String _error = '';

  Future<void> _searchMovies(String query) async {
    final q = query.trim();
    if (q.isEmpty) {
      setState(() {
        _results = [];
        _error = '';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final movies = await APIService.searchMovies(q);
      setState(() => _results = movies);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isEmptyQuery = _controller.text.trim().isEmpty;
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.background,
        elevation: 0,
        title: TextField(
          controller: _controller,
          autofocus: true,
          style: TextStyle(color: AppTheme.textLight),
          decoration: InputDecoration(
            hintText: 'Search for a movie...',
            hintStyle: TextStyle(color: AppTheme.textDim),
            prefixIcon: Icon(Icons.search, color: AppTheme.accent),
            filled: true,
            fillColor: AppTheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
          onSubmitted: _searchMovies,
          textInputAction: TextInputAction.search,
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: AppTheme.accent))
          : _error.isNotEmpty
          ? Center(
              child: Text(_error, style: TextStyle(color: AppTheme.danger)),
            )
          : isEmptyQuery
          ? _buildIdle()
          : _results.isEmpty
          ? Center(
              child: Text(
                'No results found',
                style: TextStyle(color: AppTheme.textDim),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.62,
                ),
                itemCount: _results.length,
                itemBuilder: (ctx, i) {
                  final movie = _results[i];
                  return MovieCard(movie: movie);
                },
              ),
            ),
    );
  }

  Widget _buildIdle() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/popcorn.png',
            height: 140,
            errorBuilder: (ctx, e, s) => Icon(
              Icons.local_movies_outlined,
              size: 96,
              color: AppTheme.accent,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Start searching for movies',
            style: TextStyle(color: AppTheme.textDim),
          ),
        ],
      ),
    );
  }
}
