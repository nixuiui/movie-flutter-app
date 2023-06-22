import 'package:movie_app/features/movie/domain/entities/movie.dart';

class MovieModel extends Movie {

  const MovieModel({
      super.adult,
      super.backdropPath,
      super.genreIds,
      super.id,
      super.originalLanguage,
      super.originalTitle,
      super.overview,
      super.popularity,
      super.posterPath,
      super.releaseDate,
      super.title,
      super.video,
      super.voteAverage,
      super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      genreIds: List<int>.from((json["genre_ids"] ?? []).map((x) => x)),
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"]?.toDouble(),
      posterPath: json["poster_path"],
      releaseDate: json["release_date"] != null ? DateTime.parse(json["release_date"]) : null,
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"]?.toDouble(),
      voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
      "adult": adult,
      "backdrop_path": backdropPath,
      "genre_ids": List<dynamic>.from((genreIds ?? []).map((x) => x)),
      "id": id,
      "original_language": originalLanguage,
      "original_title": originalTitle,
      "overview": overview,
      "popularity": popularity,
      "poster_path": posterPath,
      "release_date": releaseDate?.toIso8601String(),
      "title": title,
      "video": video,
      "vote_average": voteAverage,
      "vote_count": voteCount,
  };
}