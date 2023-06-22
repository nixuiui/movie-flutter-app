import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/movie/movie_routes.dart';
import 'package:movie_app/features/movie/presentation/controllers/movie_list_controller.dart';
import 'package:movie_app/features/movie/presentation/pages/movie_detail_page.dart';
import 'package:movie_app/features/movie/presentation/widgets/movie_item_widget.dart';
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
          padding: const EdgeInsets.all(16),
          children: [
            _buildMovieList(),
          ],
        ),
      ),
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
}