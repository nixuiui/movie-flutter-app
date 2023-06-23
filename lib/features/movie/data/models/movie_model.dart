import 'package:movie_app/features/movie/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
      super.adult,
      super.backdropPath,
      super.budget,
      super.genreIds,
      super.genres,
      super.homepage,
      super.id,
      super.imdbId,
      super.originalLanguage,
      super.originalTitle,
      super.overview,
      super.popularity,
      super.posterPath,
      super.productionCompanies,
      super.productionCountries,
      super.releaseDate,
      super.revenue,
      super.runtime,
      super.spokenLanguages,
      super.status,
      super.tagline,
      super.title,
      super.video,
      super.voteAverage,
      super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      budget: json["budget"],
      genreIds: List<int>.from((json["genre_ids"] ?? []).map((x) => x)),
      genres: List<GenreModel>.from((json["genres"] ?? []).map((x) => GenreModel.fromJson(x))),
      homepage: json["homepage"],
      id: json["id"],
      imdbId: json["imdb_id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"]?.toDouble(),
      posterPath: json["poster_path"],
      releaseDate: json["release_date"] != null ? DateTime.parse(json["release_date"]) : null,
      productionCompanies: List<ProductionCompanyModel>.from((json["production_companies"] ?? []).map((x) => ProductionCompanyModel.fromJson(x))),
      productionCountries: List<ProductionCountryModel>.from((json["production_countries"] ?? []).map((x) => ProductionCountryModel.fromJson(x))),
      revenue: json["revenue"],
      runtime: json["runtime"],
      spokenLanguages: List<SpokenLanguageModel>.from((json["spoken_languages"] ?? []).map((x) => SpokenLanguageModel.fromJson(x))),
      status: json["status"],
      tagline: json["tagline"],
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"]?.toDouble(),
      voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "budget": budget,
        "genre_ids": List<dynamic>.from((genreIds ?? []).map((x) => x)),
        "genres": List<dynamic>.from((genres ?? []).map((x) => (x as GenreModel).toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from((productionCompanies ?? []).map((x) => (x as ProductionCompanyModel).toJson())),
        "production_countries": List<dynamic>.from((productionCountries ?? []).map((x) => (x as ProductionCountryModel).toJson())),
        "release_date": releaseDate?.toIso8601String(),
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": List<dynamic>.from((spokenLanguages ?? []).map((x) => (x as SpokenLanguageModel).toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
  };
}

class GenreModel extends Genre {
    const GenreModel({
        super.id,
        super.name,
    });

    factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class ProductionCompanyModel extends ProductionCompany {
    const ProductionCompanyModel({
        super.id,
        super.logoPath,
        super.name,
        super.originCountry,
    });

    factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) => ProductionCompanyModel(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
    };
}

class ProductionCountryModel extends ProductionCountry{
    const ProductionCountryModel({
        super.iso31661,
        super.name,
    });

    factory ProductionCountryModel.fromJson(Map<String, dynamic> json) => ProductionCountryModel(
        iso31661: json["iso_3166_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
    };
}

class SpokenLanguageModel extends SpokenLanguage {
    const SpokenLanguageModel({
        super.englishName,
        super.iso6391,
        super.name,
    });

    factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) => SpokenLanguageModel(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
    };
}
