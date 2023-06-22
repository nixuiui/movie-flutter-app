import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/params/get_movies_params.dart';
import '../repositories/movie_repository.dart';

class GetFavoriteMovies implements UseCase<List<Movie>?, GetMoviesParams> {
  final MovieRepository repository;

  GetFavoriteMovies(this.repository);

  @override
  Future<Either<NetworkException, List<Movie>?>> call(GetMoviesParams param) async {
    return await repository.getFavoriteMovies(param);
  }
}