import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/domain/entities/params/post_mark_as_favorite_params.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/movie_repository.dart';

class PostMarkAsFavorite implements UseCase<bool?, PostMarkAsFavoriteParams> {
  final MovieRepository repository;

  PostMarkAsFavorite(this.repository);

  @override
  Future<Either<NetworkException, bool?>> call(PostMarkAsFavoriteParams param) async {
    return await repository.postMarkAsFavorite(param);
  }
}