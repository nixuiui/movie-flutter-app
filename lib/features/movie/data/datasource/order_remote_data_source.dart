import 'package:movie_app/features/movie/domain/entities/params/get_movies_params.dart';

import '../../../../core/services/network_service.dart';
import '../models/moview_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>?> getMovies(GetMoviesParams params);
  Future<List<MovieModel>?> getTopRatedMovies(GetMoviesParams params);
  Future<List<MovieModel>?> getNowPlayingMovies(GetMoviesParams params);
  Future<List<MovieModel>?> getUpcomingMovies(GetMoviesParams params);
  Future<List<MovieModel>?> getPopularMovies(GetMoviesParams params);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final NetworkService _service;

  MovieRemoteDataSourceImpl(this._service);

  @override
  Future<List<MovieModel>?> getMovies(GetMoviesParams params) async {
    var url = '/3/discover/movie';
    final response = await _service.get(url: url, parameters: params.movieListParams());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['data']['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<List<MovieModel>?> getTopRatedMovies(GetMoviesParams params) async {
    var url = '/3/movie/top_rated';
    final response = await _service.get(url: url, parameters: params.topRatedMovies());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['data']['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<List<MovieModel>?> getNowPlayingMovies(GetMoviesParams params) async {
    var url = '/3/movie/now_playing';
    final response = await _service.get(url: url, parameters: params.nowPlayingMovies());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['data']['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<List<MovieModel>?> getUpcomingMovies(GetMoviesParams params) async {
    var url = '/3/movie/upcoming';
    final response = await _service.get(url: url, parameters: params.upcomingMovies());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['data']['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }

  @override
  Future<List<MovieModel>?> getPopularMovies(GetMoviesParams params) async {
    var url = '/3/movie/popular';
    final response = await _service.get(url: url, parameters: params.upcomingMovies());
    var data = response.data != null
          ? List<MovieModel>.from(response.data['data']['results'].map((x) => MovieModel.fromJson(x)))
          : <MovieModel>[];
    return data;
  }
  
}
