import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/domain/entities/params/get_movies_params.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_add_to_watchlist_params.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_mark_as_favorite_params.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_rate_movie_params.dart';

import '../../../../core/network/network_exceptions.dart';

abstract class MovieRepository {
  Future<Either<NetworkException, List<Movie>?>> getMovies(GetMoviesParams params);
  Future<Either<NetworkException, List<Movie>?>> getTopRatedMovies(GetMoviesParams params);
  Future<Either<NetworkException, List<Movie>?>> getNowPlayingMovies(GetMoviesParams params);
  Future<Either<NetworkException, List<Movie>?>> getUpcomingMovies(GetMoviesParams params);
  Future<Either<NetworkException, List<Movie>?>> getPopularMovies(GetMoviesParams params);
  Future<Either<NetworkException, Movie?>> getMovieDetail(int id);
  Future<Either<NetworkException, List<Movie>?>> getFavoriteMovies(GetMoviesParams params);
  Future<Either<NetworkException, bool?>> postMarkAsFavorite(PostMarkAsFavoriteParams params);
  Future<Either<NetworkException, List<Movie>?>> getWatchListMovies(GetMoviesParams params);
  Future<Either<NetworkException, bool?>> postAddToWatchList(PostAddToWatchListParams params);
  Future<Either<NetworkException, List<Movie>?>> getRatedMovies(GetMoviesParams params);
  Future<Either<NetworkException, bool?>> postRateMovie(PostRateMovieParams params);
  Future<Either<NetworkException, bool?>> deleteRateMovie(int movieId);
}