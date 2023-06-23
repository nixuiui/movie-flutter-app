import 'package:flutter/material.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/resources/colors/colors.dart';
import 'package:nixui/widgets/nixui.dart';

class GenreForm extends StatelessWidget {
  
  const GenreForm({
    super.key,
    this.selectedGenres,
    this.genreOptions,
    this.onUpdateSelectedGenre,
  });

  final List<Genre>? selectedGenres;
  final List<Genre>? genreOptions;
  final Function(List<Genre>)? onUpdateSelectedGenre;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const NxText.headline6('Select Genre'),
        const SizedBox(height: 16,),
        ...(genreOptions ?? []).map((e) {
          final findIndex = selectedGenres?.indexWhere((item) => e.id == item.id) ?? -1;
          return NxBox(
            onPressed: () {
              if(findIndex > -1) {
                selectedGenres?.removeAt(findIndex);
              } else {
                selectedGenres?.add(e);
              }
              onUpdateSelectedGenre?.call(selectedGenres ?? []);
            },
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Expanded(child: NxText(e.name??'')),
                if(findIndex > -1) const Icon(
                  Icons.check_circle,
                  size: 16,
                  color: AppColors.primary,
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}