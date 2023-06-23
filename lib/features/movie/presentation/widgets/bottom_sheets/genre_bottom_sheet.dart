import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/presentation/widgets/filters/genre_form_widget.dart';
import 'package:movie_app/resources/widgets/bottom_sheet.dart';
import 'package:nixui/widgets/nixui.dart';

class GenreBottomSheet extends StatefulWidget {

  const GenreBottomSheet({
    Key? key,
    this.selectedGenres,
    this.genreOptions,
  }) : super(key: key);

  final List<Genre>? selectedGenres;
  final List<Genre>? genreOptions;

  @override
  State<GenreBottomSheet> createState() => _GenreBottomSheetState();
}

class _GenreBottomSheetState extends State<GenreBottomSheet> {

  late List<Genre>? selectedGenres;

  @override
  void initState() {
    selectedGenres = [...widget.selectedGenres ?? []];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UiBottomSheet(
      bottom: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NxButton(
          text: 'Simpan',
          width: double.infinity,
          onPressed: () {
            Get.back(result: {'genres': selectedGenres});
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GenreForm(
          genreOptions: widget.genreOptions,
          selectedGenres: selectedGenres,
          onUpdateSelectedGenre: (value) {
            setState(() {
              selectedGenres = value;
            });
          },
        ),
      ),
    );
  }
}
