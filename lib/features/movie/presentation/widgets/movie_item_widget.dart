import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/core/extensions/double.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:nixui/widgets/nixui.dart';

import '../../../../resources/widgets/image.dart';

class MovieItem extends StatelessWidget {

  final Movie movie;
  final Function()? onPressed;

  const MovieItem({
    super.key,
    required this.movie,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return NxBox(
      onPressed: onPressed?.call,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UiImage(
            url: movie.poster500Url,
            width: 120,
            height: 180,
            radius: 8,
          ),
          const SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NxText.headline4('${movie.title} (${movie.year})'),
                NxText(
                  DateFormat('MMMM dd, y').format(movie.releaseDate!),
                  color: Colors.black87,
                  lineHeight: 1.5,
                ),
                if((movie.voteAverage ?? 0) > 0) Row(
                  children: [
                    const Icon(
                      Icons.star, 
                      color: Colors.yellow, 
                      size: 16,
                    ),
                    NxText(movie.voteAverage?.maxComma(1) ?? ''),
                  ],
                ),
                const SizedBox(height: 8),
                NxText(
                  movie.overview ?? '',
                  color: Colors.grey,
                  lineHeight: 1.5,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
