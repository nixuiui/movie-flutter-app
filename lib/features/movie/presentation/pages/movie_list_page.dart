import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/const/enum.dart';
import 'package:movie_app/features/movie/movie_routes.dart';
import 'package:movie_app/features/movie/presentation/controllers/movie_list_controller.dart';
import 'package:movie_app/features/movie/presentation/pages/movie_detail_page.dart';
import 'package:movie_app/features/movie/presentation/widgets/bottom_sheets/genre_bottom_sheet.dart';
import 'package:movie_app/features/movie/presentation/widgets/bottom_sheets/sort_bottom_sheet.dart';
import 'package:movie_app/features/movie/presentation/widgets/movie_item_widget.dart';
import 'package:nixui/themes/theme.dart';
import 'package:nixui/widgets/nixui.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {

  final movieController = MovieListController.to;
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    movieController.init();
    super.initState();
  }

  void _onScroll() async {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    movieController.loadMore(maxScroll, currentScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Movies'),
      ),
      body: RefreshIndicator(
        onRefresh: movieController.refreshData,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            _buildFilterSection(),
            _buildMovieList(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Obx(() => Row(
        children: [
          NxBox(
            borderColor: NxColor.border,
            borderRadius: 50,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            onPressed: _showSortDrawer,
            child: Row(
              children: [
                const Icon(
                  Icons.sort,
                  size: 16,
                ),
                const SizedBox(width: 8,),
                NxText(movieController.sort.value.label),
              ],
            ),
          ),
          const SizedBox(width: 16,),
          NxBox(
            borderColor: NxColor.border,
            borderRadius: 50,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            onPressed: _showGenreDrawer,
            child: Row(
              children: [
                const Icon(
                  Icons.category,
                  size: 16,
                ),
                const SizedBox(width: 8,),
                NxText(movieController.selectedGenre.isNotEmpty 
                    ? '${movieController.selectedGenre.length} Genres' 
                    : 'Select Genre'),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildMovieList() {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        Obx(() => ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: movieController.movies.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16,), 
          itemBuilder: (_, index) => MovieItem(
            movie: movieController.movies[index],
            onPressed: () {
              Get.toNamed(
                movieRoutes.detail,
                arguments: MovieDetailPageArguments(movie: movieController.movies[index]),
              );
            },
          ), 
        )),
        const SizedBox(height: 16),
        Obx(() => movieController.loadingList.value ? const NxLoadingSpinner() : const SizedBox.shrink()),
      ],
    );
  }

  void _showSortDrawer() async {
    var result = await Get.bottomSheet(
      const SortBottomSheet(),
      isScrollControlled: true,
    );
    if (result != null) {
      movieController.setSort(result['sort']);
    }
  }

  void _showGenreDrawer() async {
    var result = await Get.bottomSheet(
      GenreBottomSheet(
        genreOptions: movieController.genres,
        selectedGenres: movieController.selectedGenre,
      ),
      isScrollControlled: true,
    );
    if (result != null) {
      print(result['genres']);
      movieController.setGenres(result['genres']);
    }
  }
}