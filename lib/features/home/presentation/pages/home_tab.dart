import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/home/presentation/controllers/home_controller.dart';
import 'package:movie_app/features/home/presentation/widgets/movies_section_widget.dart';
import 'package:movie_app/resources/colors/colors.dart';
import 'package:nixui/themes/theme.dart';
import 'package:nixui/widgets/nixui.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final homeController = HomeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 40),
        children: [
          _buildHeader(),
          _buildNowPlaying(),
          _buildUpcoming(),
          _buildPopular(),
          _buildTopRated(),
        ],
      ),
    );
  }

  Widget _buildTopRated() {
    return Obx(() => MoviesSectionWidget(
      title: 'Top Rated',
      movies: homeController.topRatedMovies,
      isLoading: homeController.topRatedLoading.value,
    ));
  }

  Widget _buildPopular() {
    return Obx(() => MoviesSectionWidget(
      title: 'Popular',
      movies: homeController.popularMovies,
      isLoading: homeController.popularLoading.value,
    ));
  }

  Widget _buildUpcoming() {
    return Obx(() => MoviesSectionWidget(
      title: 'Upcoming',
      movies: homeController.upcomingMovies,
      isLoading: homeController.upcomingLoading.value,
    ));
  }

  Widget _buildNowPlaying() {
    return Obx(() => MoviesSectionWidget(
      title: 'Now Playing',
      movies: homeController.nowPlayingMovies,
      isLoading: homeController.nowPlayingLoading.value,
    ));
  }

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        image: DecorationImage(
          image: NetworkImage('https://www.themoviedb.org/t/p/w1920_and_h600_multi_faces_filter(duotone,00192f,00baff)/2Sm3asuwKVNTzgm2nF6hp5mwEfh.jpg'),
          fit: BoxFit.cover
        )
      ),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NxText.headline1(
            'Welcome To Movie',
            color: Colors.white,
          ),
          const NxText(
            'Let\'s browse The Milions Movie here',
            color: Colors.white,
            lineHeight: 1.5,
          ),
          const SizedBox(height: 16,),
          NxButton(
            text: 'Browse Movies',
            color: NxColor.secondary,
            textColor: NxColor.primary,
            fontWeight: FontWeight.w500,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            onPressed: () {

            },
          )
        ],
      )
    );
  }
}
