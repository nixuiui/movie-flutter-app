import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_rate_movie_params.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class PostRateMovie implements UseCase<bool?, PostRateMovieParams> {
  final MovieRepository repository;

  PostRateMovie(this.repository);

  @override
  Future<Either<NetworkException, bool?>> call(PostRateMovieParams param) async {
    return await repository.postRateMovie(param);
  }
}