import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/domain/entities/params/get_movies_params.dart';

import '../../../../core/network/network_exceptions.dart';

abstract class MovieRepository {
  Future<Either<NetworkException, List<Movie>?>> getMovies(GetMoviesParams params);
  Future<Either<NetworkException, List<Movie>?>> getTopRatedMovies(GetMoviesParams params);
  Future<Either<NetworkException, List<Movie>?>> getNowPlayingMovies(GetMoviesParams params);
  Future<Either<NetworkException, List<Movie>?>> getUpcomingMovies(GetMoviesParams params);
  Future<Either<NetworkException, List<Movie>?>> getPopularMovies(GetMoviesParams params);
}