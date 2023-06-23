import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/core/extensions/double.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/presentation/controllers/movie_detail_controller.dart';
import 'package:nixui/themes/theme.dart';
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
        actions: [
          IconButton(
            onPressed: detailController.masrkAsFavorite, 
            icon: const Icon(Icons.favorite)
          ),
          IconButton(
            onPressed: detailController.addToWatchlist, 
            icon: const Icon(Icons.bookmark_outline_rounded)
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: detailController.fetchMovieDetail,
        child: ListView(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 60),
          children: [
            _buildHeader(),
            _buildDescription()
          ],
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Obx(() {
      final movie = detailController.movie.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NxText(
            'Overview',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            lineHeight: 1.5,
          ),
          const SizedBox(height: 8,),
          NxText(
            movie?.overview ?? '',
            lineHeight: 1.5,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16,),
          const NxText(
            'Released Date',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            lineHeight: 1.5,
          ),
          const SizedBox(height: 8,),
          NxText(
            DateFormat('MMMM dd, y').format(movie?.releaseDate ?? DateTime.now()),
            lineHeight: 1.5,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16,),
          const NxText(
            'Genres',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            lineHeight: 1.5,
          ),
          const SizedBox(height: 8,),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (movie?.genres ?? []).map((item) => NxBox(
              borderRadius: 50,
              borderColor: NxColor.border,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: NxText(
                item.name ?? '',
                textAlign: TextAlign.justify,
              ),
            ),).toList(),
          ),
          const SizedBox(height: 16,),
          const NxText(
            'Production Companies',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            lineHeight: 1.5,
          ),
          const SizedBox(height: 8,),
          ListView.separated(
            itemCount: movie?.productionCompanies?.length ?? 0,
            separatorBuilder: (_, __) => const SizedBox(height: 8), 
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (_, index) => NxText(
              movie?.productionCompanies![index].name ?? '',
              lineHeight: 1.5,
              textAlign: TextAlign.justify,
            ), 
          ),
          const SizedBox(height: 16,),
          const NxText(
            'Production Countries',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            lineHeight: 1.5,
          ),
          const SizedBox(height: 8,),
          ListView.separated(
            itemCount: movie?.productionCountries?.length ?? 0,
            separatorBuilder: (_, __) => const SizedBox(height: 8), 
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (_, index) => NxText(
              movie?.productionCountries![index].name ?? '',
              lineHeight: 1.5,
              textAlign: TextAlign.justify,
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