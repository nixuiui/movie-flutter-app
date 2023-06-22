import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/network/network_exceptions.dart';

abstract class UseCase<Type, Params> {
  Future<Either<NetworkException, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
