import 'package:movie_app/core/const/app_consts.dart';
import 'package:movie_app/features/movie/domain/entities/params/get_movies_params.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_add_to_watchlist_params.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_mark_as_favorite_params.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_rate_movie_params.dart';

import '../../../../core/services/network_service.dart';
import '../models/moview_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>?> getMovies(GetMoviesParams params);
  Future<List<MovieModel>?> getTopRatedMovies(GetMoviesParams params);
  Future<List<MovieModel>?> getNowPlayingMovies(GetMoviesParams params);
  Future<List<MovieModel>?> getUpcomingMovies(GetMoviesParams params);
  Future<List<MovieModel>?> getPopularMovies(GetMoviesParams params);
  Future<MovieModel?> getMovieDetail(int movieId);
  Future<List<MovieModel>?> getFavoriteMovies(GetMoviesParams params);
  Future<bool?> postMarkAsFavorite(PostMarkAsFavoriteParams params);
  Future<List<MovieModel>?> getWatchListMovies(GetMoviesParams params);
  Future<bool?> postAddToWatchList(PostAddToWatchListParams params);
  Future<List<MovieModel>?> getRatedMovies(GetMoviesParams params);
  Future<bool?> postRateMovie(PostRateMovieParams params);
  Future<bool?> deleteRateMovie(int movieId);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final NetworkService _service;

  MovieRemoteDataSourceImpl(this._service);

  @override
  Future<List<MovieModel>?> getMovies(GetMoviesParams params) async {
    var url = '/3/discover/movie';
    final response = await _service.get(url: url, parameters: params.movieListParams());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<List<MovieModel>?> getTopRatedMovies(GetMoviesParams params) async {
    var url = '/3/movie/top_rated';
    final response = await _service.get(url: url, parameters: params.withPaginationOnly());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<List<MovieModel>?> getNowPlayingMovies(GetMoviesParams params) async {
    var url = '/3/movie/now_playing';
    final response = await _service.get(url: url, parameters: params.withPaginationOnly());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<List<MovieModel>?> getUpcomingMovies(GetMoviesParams params) async {
    var url = '/3/movie/upcoming';
    final response = await _service.get(url: url, parameters: params.withPaginationOnly());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<List<MovieModel>?> getPopularMovies(GetMoviesParams params) async {
    var url = '/3/movie/popular';
    final response = await _service.get(url: url, parameters: params.withPaginationOnly());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<MovieModel?> getMovieDetail(int movieId) async {
    var url = '/3/movie/$movieId';
    final response = await _service.get(url: url);
    return MovieModel.fromJson(response.data);
  }

  @override
  Future<List<MovieModel>?> getFavoriteMovies(GetMoviesParams params) async {
    var url = '/3/account/${AppConsts.accountId}/favorite/movies';
    final response = await _service.get(url: url, parameters: params.withPaginationOnly());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<bool?> postMarkAsFavorite(PostMarkAsFavoriteParams params) async {
    var url = '/3/account/${AppConsts.accountId}/favorite';
    await _service.post(url: url, data: params.toJson());
    return true;
  }

  @override
  Future<List<MovieModel>?> getWatchListMovies(GetMoviesParams params) async {
    var url = '/3/account/${AppConsts.accountId}/watchlist/movies';
    final response = await _service.get(url: url, parameters: params.withPaginationOnly());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<bool?> postAddToWatchList(PostAddToWatchListParams params) async {
    var url = '/3/account/${AppConsts.accountId}/watchlist';
    await _service.post(url: url, data: params.toJson());
    return true;
  }

  @override
  Future<List<MovieModel>?> getRatedMovies(GetMoviesParams params) async {
    var url = '/3/account/${AppConsts.accountId}/rated/movies';
    final response = await _service.get(url: url, parameters: params.withPaginationOnly());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<bool?> postRateMovie(PostRateMovieParams params) async {
    var url = '/3/account/${AppConsts.accountId}/watchlist';
    await _service.post(url: url, data: params.toJson());
    return true;
  }

  @override
  Future<bool?> deleteRateMovie(int movieId) async {
    var url = '/3/movie/$movieId/rating';
    await _service.get(url: url);
    return true;
  }
  
}
