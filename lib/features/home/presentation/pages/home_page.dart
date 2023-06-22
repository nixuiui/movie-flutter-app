import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/controllers/home_controller.dart';
import 'package:movie_app/features/movie/presentation/controllers/favorite_movies_controller.dart';
import 'package:movie_app/features/movie/presentation/pages/favorite_movies_page.dart';
import 'package:nixui/themes/theme.dart';

import 'home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var selectedIndex = 0;

  final _parentKey = GlobalKey();

  final homeController = HomeController.to;
  final favoriteMoviesController = FavoriteMovieController.to;

  @override
  void initState() {
    homeController.init();
    favoriteMoviesController.init();
    super.initState();
  }

  void selectIndex(int selectedIndex) {
    setState(() {
      this.selectedIndex = selectedIndex;
    });
  }

  Widget _bodyOptions() {
    switch(selectedIndex) {
      case 0:
        return const HomeTab();
      case 1:
        return const FavoriteMoviesPage();
      case 2:
        return const Text('ss');
      default:
        return const Text('ss');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _parentKey,
      body: Stack(
        children: [
          _bodyOptions(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedLabelStyle: const TextStyle(
          color: Color(0xffc2c3c2),
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.24,
          height: 1.4,
        ),
        selectedLabelStyle: TextStyle(
          color: NxColor.primary,
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.24,
          height: 1.4,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.alarm),
            activeIcon:  Icon(Icons.alarm),
            label: 'Watchlist',
          ),
        ],
        currentIndex: selectedIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: NxColor.primary,
        unselectedItemColor: const Color(0xffc2c3c2),
        onTap: selectIndex,
      ),
    );
  }
}
