import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_add_to_watchlist_params.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class PostAddToWatchList implements UseCase<bool?, PostAddToWatchListParams> {
  final MovieRepository repository;

  PostAddToWatchList(this.repository);

  @override
  Future<Either<NetworkException, bool?>> call(PostAddToWatchListParams param) async {
    return await repository.postAddToWatchList(param);
  }
}