import 'package:flutter/material.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:nixui/widgets/nixui.dart';
import 'package:shimmer/shimmer.dart';

class MoviesSectionWidget extends StatelessWidget {
  const MoviesSectionWidget({
    super.key,
    required this.movies,
    required this.title,
    this.isLoading = false,
    this.onItemClicked,
  });

  final String title;
  final List<Movie> movies;
  final bool isLoading;
  final Function(Movie)? onItemClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: NxText.headline4(title),
          ),
          isLoading ? _buildMovieListShimmer() : _buildMovieList()
        ],
      ),
    );
  }

  Widget _buildMovieList() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(movies.length, (index) {
          return Container(
            margin: index > 0 ? const EdgeInsets.only(left: 16) : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: NxBox(
                color: Colors.grey,
                width: 120,
                height: 180,
                onPressed: () {
                  onItemClicked?.call(movies[index]);
                },
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[300],
                      child: Image.network(
                        width: 120,
                        height: 180,
                        movies[index].poster500Url,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 120,
                            height: 180,
                            color: Colors.grey[300],
                            child: const Center(
                              child: NxLoadingSpinner()
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ),
            ),
          );
        })
      ),
    );
  }

  Widget _buildMovieListShimmer() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(movies.length, (index) {
          return Container(
            margin: index > 0 ? const EdgeInsets.only(left: 16) : null,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 120,
                height: 180,
                margin: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          );
        })
      ),
    );
  }
}