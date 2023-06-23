import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Movie extends Equatable {
    final bool? adult;
    final String? backdropPath;
    final int? budget;
    final List<int>? genreIds;
    final List<Genre>? genres;
    final String? homepage;
    final int? id;
    final String? imdbId;
    final String? originalLanguage;
    final String? originalTitle;
    final String? overview;
    final double? popularity;
    final String? posterPath;
    final List<ProductionCompany>? productionCompanies;
    final List<ProductionCountry>? productionCountries;
    final DateTime? releaseDate;
    final int? revenue;
    final int? runtime;
    final List<SpokenLanguage>? spokenLanguages;
    final String? status;
    final String? tagline;
    final String? title;
    final bool? video;
    final double? voteAverage;
    final int? voteCount;

    const Movie({
        this.adult,
        this.backdropPath,
        this.budget,
        this.genreIds,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    String? get backdropUrl => 'https://image.tmdb.org/t/p/original/$backdropPath';
    String? get backdrop500Url => 'https://image.tmdb.org/t/p/w500/$backdropPath';

    String? get posterUrl => 'https://image.tmdb.org/t/p/original/$posterPath';
    String? get poster500Url => 'https://image.tmdb.org/t/p/w500/$posterPath';

    String get year => DateFormat('y').format(releaseDate ?? DateTime.now());

    @override
    List<Object?> get props => [
      adult,
      backdropPath,
      budget,
      genreIds,
      genres,
      homepage,
      id,
      imdbId,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      productionCompanies,
      productionCountries,
      releaseDate,
      revenue,
      runtime,
      spokenLanguages,
      status,
      tagline,
      title,
      video,
      voteAverage,
      voteCount,
    ];
}

class Genre extends Equatable {
    final int? id;
    final String? name;

    const Genre({
      this.id,
      this.name,
    });

    @override
    List<Object?> get props => [
      id,
      name,
    ];
}

class ProductionCompany extends Equatable {
    final int? id;
    final dynamic logoPath;
    final String? name;
    final String? originCountry;

    const ProductionCompany({
        this.id,
        this.logoPath,
        this.name,
        this.originCountry,
    });
    
    @override
    List<Object?> get props => [
      id,
      logoPath,
      name,
      originCountry,
    ];
}

class ProductionCountry extends Equatable {
    final String? iso31661;
    final String? name;

    const ProductionCountry({
        this.iso31661,
        this.name,
    });
    
    @override
    List<Object?> get props => [
      iso31661,
      name,
    ];
}

class SpokenLanguage extends Equatable {
    final String? englishName;
    final String? iso6391;
    final String? name;

    const SpokenLanguage({
      this.englishName,
      this.iso6391,
      this.name,
    });

    @override
    List<Object?> get props => [
      englishName,
      iso6391,
      name,
    ];
}
