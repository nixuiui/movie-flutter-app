import 'package:dartz/dartz.dart';
import 'package:movie_app/core/network/network_exceptions.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/domain/entities/params/get_movies_params.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_add_to_watchlist_params.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_mark_as_favorite_params.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_rate_movie_params.dart';

import '../../../../core/network/api_call.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasource/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<NetworkException, List<Movie>?>> getMovies(GetMoviesParams params) async {
    return await apiCall(remoteDataSource.getMovies(params));
  }

  @override
  Future<Either<NetworkException, List<Movie>?>> getTopRatedMovies(GetMoviesParams params) async {
    return await apiCall(remoteDataSource.getTopRatedMovies(params));
  }

  @override
  Future<Either<NetworkException, List<Movie>?>> getNowPlayingMovies(GetMoviesParams params) async {
    return await apiCall(remoteDataSource.getNowPlayingMovies(params));
  }

  @override
  Future<Either<NetworkException, List<Movie>?>> getUpcomingMovies(GetMoviesParams params) async {
    return await apiCall(remoteDataSource.getUpcomingMovies(params));
  }
  
  @override
  Future<Either<NetworkException, List<Movie>?>> getPopularMovies(GetMoviesParams params) async {
    return await apiCall(remoteDataSource.getPopularMovies(params));
  }

  @override
  Future<Either<NetworkException, Movie?>> getMovieDetail(int id) async {
    return await apiCall(remoteDataSource.getMovieDetail(id));
  }
  
  @override
  Future<Either<NetworkException, List<Movie>?>> getFavoriteMovies(GetMoviesParams params) async {
    return await apiCall(remoteDataSource.getFavoriteMovies(params));
  }

  @override
  Future<Either<NetworkException, bool?>> postMarkAsFavorite(PostMarkAsFavoriteParams params) async {
    return await apiCall(remoteDataSource.postMarkAsFavorite(params));
  }
  
  @override
  Future<Either<NetworkException, List<Movie>?>> getWatchListMovies(GetMoviesParams params) async {
    return await apiCall(remoteDataSource.getWatchListMovies(params));
  }

  @override
  Future<Either<NetworkException, bool?>> postAddToWatchList(PostAddToWatchListParams params) async {
    return await apiCall(remoteDataSource.postAddToWatchList(params));
  }

  @override
  Future<Either<NetworkException, List<Movie>?>> getRatedMovies(GetMoviesParams params) async {
    return await apiCall(remoteDataSource.getRatedMovies(params));
  }

  @override
  Future<Either<NetworkException, bool?>> postRateMovie(PostRateMovieParams params) async {
    return await apiCall(remoteDataSource.postRateMovie(params));
  }

  @override
  Future<Either<NetworkException, bool?>> deleteRateMovie(int movieId) async {
    return await apiCall(remoteDataSource.deleteRateMovie(movieId));
  }

  @override
  Future<Either<NetworkException, List<Genre>?>> getGenres() async {
    return await apiCall(remoteDataSource.getGenres());
  }

}
