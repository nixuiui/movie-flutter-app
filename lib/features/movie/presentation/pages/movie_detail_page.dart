import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/core/extensions/double.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/presentation/controllers/movie_detail_controller.dart';
import 'package:nixui/widgets/nixui.dart';

class MovieDetailPageArguments {
  final Movie movie;
  
  MovieDetailPageArguments({
    required this.movie,
  });
}

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {

  final detailController = MovieDetailController.to;

  @override
  void initState() {
    final args = Get.arguments as MovieDetailPageArguments;
    detailController.init(movie: args.movie);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(),
          _buildDescription()
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Obx(() {
      final movie = detailController.movie.value;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8),
          //   child: Container(
          //     color: Colors.grey[300],
          //     child: Image.network(
          //       width: 100,
          //       height: 150,
          //       movie?.poster500Url ?? '',
          //       fit: BoxFit.cover,
          //       loadingBuilder: (context, child, loadingProgress) {
          //         if (loadingProgress == null) return child;
          //         return Container(
          //           width: 120,
          //           height: 180,
          //           color: Colors.grey[300],
          //           child: const Center(
          //             child: NxLoadingSpinner()
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          // const SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NxText(
                  'Overview',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  lineHeight: 1.5,
                ),
                NxText(
                  movie?.overview ?? '',
                  lineHeight: 1.5,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buildHeader() {
    return Obx(() {
      final movie = detailController.movie.value;
      return Container(
        margin: const EdgeInsets.only(bottom: 32),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                color: Colors.grey[200],
                child: AspectRatio(
                  aspectRatio: 2/1,
                  child: Image.network(
                    width: double.infinity,
                    movie?.backdrop500Url ?? '',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: NxLoadingSpinner()
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NxText.headline3(
                      '${movie!.title} (${DateFormat('y').format(movie.releaseDate!)})',
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 16,),
                        const SizedBox(width: 8),
                        NxText(
                          movie.voteAverage?.maxComma(1) ?? '',
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}