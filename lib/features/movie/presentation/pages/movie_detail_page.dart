import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/core/extensions/double.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/presentation/controllers/movie_detail_controller.dart';
import 'package:nixui/widgets/nixui.dart';

import '../../../../resources/widgets/image.dart';

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
          UiImage(
            url: movie?.poster500Url,
            width: 100,
            height: 150,
          ),
          const SizedBox(width: 16,),
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
            AspectRatio(
              aspectRatio: 2/1,
              child: UiImage(
                url: movie?.backdrop500Url,
                width: double.infinity,
                radius: 16,
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