import 'package:dartz/dartz.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class DeleteRateMovie implements UseCase<bool?, int> {
  final MovieRepository repository;

  DeleteRateMovie(this.repository);

  @override
  Future<Either<NetworkException, bool?>> call(int movieId) async {
    return await repository.deleteRateMovie(movieId);
  }
}