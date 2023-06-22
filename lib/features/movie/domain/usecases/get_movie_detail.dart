import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetail implements UseCase<Movie?, int> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<NetworkException, Movie?>> call(int param) async {
    return await repository.getMovieDetail(param);
  }
}