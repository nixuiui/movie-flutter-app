import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class GetGenres implements UseCase<List<Genre>?, NoParams> {
  final MovieRepository repository;

  GetGenres(this.repository);

  @override
  Future<Either<NetworkException, List<Genre>?>> call(NoParams param) async {
    return await repository.getGenres();
  }
}