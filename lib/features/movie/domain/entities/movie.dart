import 'package:equatable/equatable.dart';

class Movie extends Equatable {
    final bool? adult;
    final String? backdropPath;
    final List<int>? genreIds;
    final int? id;
    final String? originalLanguage;
    final String? originalTitle;
    final String? overview;
    final double? popularity;
    final String? posterPath;
    final DateTime? releaseDate;
    final String? title;
    final bool? video;
    final double? voteAverage;
    final int? voteCount;

    const Movie({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    String get backdropUrl => 'https://image.tmdb.org/t/p/original/$backdropPath';
    String get backdrop500Url => 'https://image.tmdb.org/t/p/w500/$backdropPath';

    String get posterUrl => 'https://image.tmdb.org/t/p/original/$posterPath';
    String get poster500Url => 'https://image.tmdb.org/t/p/w500/$posterPath';

    @override
    List<Object?> get props => [
      adult,
      backdropPath,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount,     
    ];
}