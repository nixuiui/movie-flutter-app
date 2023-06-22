import 'package:dartz/dartz.dart';
import 'package:movie_app/core/network/network_exceptions.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/domain/entities/params/get_movies_params.dart';

import '../../../../core/network/api_call.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasource/order_remote_data_source.dart';

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

}
